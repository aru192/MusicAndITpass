class_name AudioChart
extends RefCounted

# Decode without audible playback. Energy rises in short windows identify attacks;
# timestamps stay on the recording timeline, never quantized to a BPM grid.
static func analyze(stream: AudioStream) -> Array:
	var playback := stream.instantiate_playback()
	if playback == null: return []
	var rate := float(AudioServer.get_mix_rate())
	var frames := maxi(1, roundi(rate * 0.01))
	var step := frames / rate
	var energy: Array[float] = []
	playback.start()
	for block in ceili(stream.get_length() / step):
		var samples := playback.mix_audio(1.0, frames)
		var power := 0.0
		for sample in samples:
			power += sample.length_squared() * 0.5
		energy.append(sqrt(power / maxf(samples.size(), 1)))
	playback.stop()
	return detect(energy, step)

static func detect(energy: Array[float], step: float) -> Array:
	var events: Array = []
	var novelty: Array[float] = []
	for i in energy.size():
		novelty.append(maxf(0, energy[i] - (energy[i - 1] if i > 0 else 0.0)))
	for i in range(1, energy.size() - 1):
		var baseline := 0.0
		for j in range(maxi(0, i - 20), i): baseline += novelty[j]
		baseline /= mini(i, 20)
		if energy[i] < 0.008 or novelty[i] < maxf(0.004, baseline * 2.0): continue
		if novelty[i] < novelty[i - 1] or novelty[i] <= novelty[i + 1]: continue
		var time := i * step
		if time < 0.8: continue
		if not events.is_empty() and time - float(events[-1].time) < 0.12:
			if novelty[i] > float(events[-1].strength): events[-1] = {"time": time, "strength": novelty[i]}
		else:
			events.append({"time": time, "strength": novelty[i]})
	return events

static func notes(events: Array, difficulty: int) -> Array:
	var gap: float = [1.25, 0.85, 0.55][clampi(difficulty, 0, 2)]
	var selected: Array = []
	# Choose strongest attacks first so low density retains musical accents.
	var ranked := events.duplicate()
	ranked.sort_custom(func(a: Dictionary, b: Dictionary): return float(a.strength) > float(b.strength))
	for event in ranked:
		var time := float(event.time)
		var allowed := true
		for existing in selected:
			if absf(time - float(existing)) < gap:
				allowed = false
				break
		if allowed: selected.append(time)
	selected.sort()
	return selected

# Keep a whole approach window after the previous group's late/release window.
# Slower approach settings thin dense passages without moving audio timestamps.
static func playable(times: Array, difficulty: int, approach: float) -> Array:
	var result: Array = []
	var free_at := 0.0
	for index in times.size():
		var time := float(times[index])
		if time - approach < free_at: continue
		var kind := "tap"
		var end := time
		if difficulty >= 1 and result.size() % 4 == 2 and index + 1 < times.size():
			var next := float(times[index + 1])
			if next - time >= 0.4 and next - time <= 1.8:
				kind = "hold"
				end = next
		if difficulty >= 2 and result.size() % 4 == 1: kind = "double"
		result.append({"time": time, "end": end, "kind": kind})
		free_at = end + GameBalance.GOOD_WINDOW + 0.04
	return result
