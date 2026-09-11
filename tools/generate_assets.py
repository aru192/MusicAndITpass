"""Generate the project's original demo music and vector jackets (Python stdlib)."""
from pathlib import Path
import math, wave, array, random, json
ROOT = Path(__file__).resolve().parents[1]
RATE = 22050

def song(name, bpm, root, seed):
    rng = random.Random(seed)
    beat = 60 / bpm
    duration = 96 * beat
    samples = array.array('h')
    progression = [0, 5, 9, 7]
    scale = [0, 4, 7, 11, 12, 7, 4, 2]
    for i in range(round(duration * RATE)):
        t = i / RATE
        b = int(t / beat)
        u = t % beat
        chord = progression[(b // 8) % 4]
        kick = math.sin(2 * math.pi * (47 * u + 7 * (1 - math.exp(-30 * u)))) * math.exp(-u * 19) * .40
        hat_t = t % (beat / 2)
        hat = (rng.random() * 2 - 1) * math.exp(-hat_t * 100) * .055
        snare = (rng.random() * 2 - 1) * math.exp(-u * 28) * .10 if b % 2 else 0
        bass_f = root * 2 ** (chord / 12) / 2
        bass = math.sin(2 * math.pi * bass_f * t) * min(u * 90, 1) * math.exp(-u * 4) * .18
        note_t = t % (beat / 2)
        f = root * 2 ** ((chord + scale[int(t / (beat / 2)) % 8] + 12) / 12)
        lead = (math.sin(2 * math.pi * f * t) + .25 * math.sin(4 * math.pi * f * t)) * math.exp(-note_t * 13) * min(note_t * 160, 1) * .11
        pad = sum(math.sin(2 * math.pi * root * 2 ** ((chord + n) / 12) * t) for n in [0, 4, 7]) * .022
        fade = min(1, max(0, (duration - t) / .04))
        samples.append(round(max(-1, min(1, kick + hat + snare + bass + lead + pad)) * fade * 28000))
    with wave.open(str(ROOT / 'assets/music' / f'{name}.wav'), 'wb') as out:
        out.setparams((1, 2, RATE, 0, 'NONE', 'not compressed'))
        out.writeframes(samples.tobytes())
    return duration

catalog = []
for index, (name, title, bpm, root, colors) in enumerate([
    ('mint_circuit', 'Mint Circuit', 120, 130.8128, ('#bbef83', '#203a42')),
    ('violet_sky', 'Violet Sky', 100, 146.8324, ('#c7b4ff', '#372851')),
    ('peach_signal', 'Peach Signal', 140, 164.8138, ('#ffb79c', '#693942')),
]):
    duration = song(name, bpm, root, index)
    a, b = colors
    svg = f'''<svg xmlns="http://www.w3.org/2000/svg" width="640" height="640" viewBox="0 0 640 640"><rect width="640" height="640" rx="44" fill="{a}"/><circle cx="440" cy="190" r="210" fill="{b}"/><circle cx="440" cy="190" r="139" fill="none" stroke="{a}" stroke-width="2"/><circle cx="440" cy="190" r="95" fill="none" stroke="{a}" stroke-width="2"/><circle cx="440" cy="190" r="27" fill="{a}"/><path d="M-30 380 Q150 250 310 390 T680 360 M-30 412 Q150 282 310 422 T680 392 M-30 444 Q150 314 310 454 T680 424" fill="none" stroke="{b}" stroke-width="9"/><rect x="42" y="42" width="92" height="10" rx="5" fill="{b}"/><rect x="42" y="64" width="54" height="10" rx="5" fill="{b}"/><circle cx="60" cy="553" r="17" fill="{b}"/><circle cx="108" cy="553" r="17" fill="{b}"/><circle cx="156" cy="553" r="17" fill="{b}"/></svg>'''
    (ROOT / 'assets/images' / f'{name}.svg').write_text(svg)
    catalog.append({'id': name, 'title': title, 'artist': 'BIT / BEAT · Original Demo', 'bpm': bpm, 'duration': duration, 'beat_offset': 0.0, 'audio': f'res://assets/music/{name}.wav', 'jacket': f'res://assets/images/{name}.svg', 'difficulties': [{'id': 'beginner', 'name': 'BEGINNER', 'level': 1, 'colors': 3, 'rank_target': 4000, 'note_interval_beats': 4}, {'id': 'normal', 'name': 'NORMAL', 'level': 5, 'colors': 4, 'rank_target': 10000, 'note_interval_beats': 2}, {'id': 'hard', 'name': 'HARD', 'level': 10, 'colors': 5, 'rank_target': 23000, 'note_interval_beats': 1}]})
(ROOT / 'resources/music/catalog.json').write_text(json.dumps(catalog, ensure_ascii=False, indent=2))
with wave.open(str(ROOT / 'assets/sounds/unlock.wav'), 'wb') as out:
    out.setparams((1, 2, RATE, 0, 'NONE', 'not compressed'))
    out.writeframes(bytes(882))
print('Generated 3 original tracks, jackets, catalog, and silent audio unlock.')
