class_name ScoreManager
extends RefCounted

static func apply_miss() -> void:
	GameData.miss_count += 1
	GameData.combo = 0

static func apply_hit(chain_length: int, error_seconds: float) -> Dictionary:
	var judgment := GameBalance.judge(error_seconds)
	if judgment == "MISS":
		GameData.combo = 0
		GameData.miss_count += 1
	else:
		GameData.combo += 1
		if judgment == "PERFECT":
			GameData.perfect_count += 1
		else:
			GameData.good_count += 1
	GameData.max_combo = maxi(GameData.max_combo, GameData.combo)
	GameData.longest_chain = maxi(GameData.longest_chain, chain_length)
	var chain_factor := 1.0 + maxf(chain_length - GameBalance.MIN_CHAIN, 0) * GameBalance.CHAIN_STEP
	var combo_factor := minf(1.0 + GameData.combo * GameBalance.COMBO_STEP, GameBalance.COMBO_CAP)
	var points := GameBalance.POINTS_PER_PIECE * float(GameBalance.TIMING_MULTIPLIERS[judgment])
	points *= chain_factor * combo_factor * GameBalance.quiz_bonus(GameData.quiz_correct)
	if chain_length >= GameBalance.LONG_CHAIN and judgment == "PERFECT":
		points *= GameBalance.LONG_PERFECT_MULTIPLIER
	var gained := roundi(points)
	GameData.score += gained
	return {"judgment": judgment, "points": gained, "milestone": GameBalance.MILESTONES.has(GameData.combo)}
