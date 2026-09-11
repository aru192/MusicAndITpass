"""Generate a full source appendix and STEP-by-STEP implementation map."""
from pathlib import Path
ROOT = Path(__file__).resolve().parents[1]
steps = [
('プロジェクト設定','縦画面・60FPS上限・Compatibilityを設定','project.godot','ProjectSettings','Display/Window: 390×844, canvas_items, expand, Portrait。Application/Run/Max FPS: 60','設定値を確認しF5でタイトルが起動する'),
('Scene・Autoload構成','7画面と共有データを分離','scripts/GameData.gd','Root / SaveManager, GameData, MusicManager','Project → Project Settings → Globals → Autoload: 3件を有効化（設定済み）','Scene遷移後も選択した曲・難易度を保持'),
('タイトル画面','スタート・遊び方・設定を表示','scripts/ui/Title.gd','Title / SafeArea / Center / Content','Title: Layout=Full Rect。Background: Color=f6f5f0','スタートから楽曲選択へ。iOS/Webでは終了ボタンを非表示'),
('ミュージック選択','ジャケット、試聴、難易度、記録を表示','scripts/ui/MusicSelect.gd','MusicSelect / Content / ScrollContainer','ジャケット: Expand Ignore Size, Keep Aspect Centered。左右ボタン: 最小44px','3曲を切り替え、難易度別の記録が切り替わる'),
('クイズ選択','シーン内のジャンルボタンをデータへ接続','scripts/ui/QuizSelect.gd','QuizSelect / Content / ScrollContainer','ボタン: 最小高さ52px。Scroll: Horizontal Disabled','7ジャンルと全ジャンルが選べる'),
('4択クイズ','重複なし10問、正誤と解説を表示','scripts/ui/Quiz.gd','Quiz / Content / ProgressBar, ScrollContainer, Footer','回答ボタン: 最小高さ60px。ProgressBar: Max Value=10','連続タップしても1問につき1回答、回答後に次ボタンを表示'),
('クイズ終了・カウントダウン','クイズ成績を保存し3秒待って開始','scripts/ui/Countdown.gd','Countdown / Content / CountLabel','Timer: process_always=false（コード生成）。Pause可能','3→2→1→START。待機中は音楽・盤面を開始しない'),
('ゲーム画面UI','ジャケット・曲・コンボ・盤面・判定を配置','scripts/ui/Game.gd','Game / Content / Header, PuzzleField, Actions, Stats','PuzzleField: Vertical Expand Fill, 最小高さ320px','得点、残り時間、判定回数を表示'),
('ピース生成','48個の丸いピースを安定配置','scripts/PuzzleManager.gd','Game / Content / PuzzleField','列6、行8。色数はcatalog.jsonのdifficulties.colors','色と記号で区別した丸が下側に集まる'),
('同色接続','マウス・タッチの押下で同色接続と後戻り','scripts/PuzzleManager.gd','PuzzleField / ConnectionLine','Line2D: Width=7, Round Cap, Antialiased=On','同色・距離条件を満たすピースのみつながる。1つ前へ戻れる'),
('削除・落下・補充','3個以上つないで消すボタンで削除・補充','scripts/PuzzleManager.gd','PuzzleField（ピースはRefCountedデータ）','GameBalance: MIN_CHAIN=3, FALL_SPEED=12','48個を維持し、上のピースが落下。手詰まり時に接続を保証'),
('BGM再生','実音源を再生し、ユーザー操作で音声を有効化','scripts/MusicManager.gd','MusicManager / BGM','AudioStreamPlayer: Playback Type=Stream, Bus=Master','3曲を試聴でき、カウントダウン後に選択曲が鳴る'),
('BPM同期','音声の再生位置に同期し、RhythmSchedulerで4／2／1拍ごとに対象を抽選','scripts/MusicManager.gd','MusicManager / BGM, Game / PuzzleFieldの選ばれた1個の丸','catalog.json: bpm, beat_offset, difficulties.note_interval_beats。Settings: offset_ms','get_playback_position＋last mix−output latencyで時刻を取得'),
('タイミング判定','対象の丸を押した瞬間と、そのリングの予定拍を比較','scripts/GameBalance.gd','PuzzleField → Game','PERFECT_WINDOW=0.080, GOOD_WINDOW=0.180','±80msと±180msの境界を含めて正しく判定'),
('スコア','ピース・判定・チェーン・コンボ・クイズ倍率を合成','scripts/ScoreManager.gd','Game / ScoreLabel','POINTS_PER_PIECE=100。倍率はGameBalanceへ集約','各ピースを押した瞬間に1回加点。指を離しても判定せず、接続を保持'),
('コンボ・チェーン','GOOD以上の連続成功と長い接続を評価','scripts/ScoreManager.gd','Game / ComboLabel, Judgment','MILESTONES=[50,100,200], LONG_CHAIN=7','MISSでコンボを0にし、最大コンボは保持'),
('ゲーム終了','曲の終了で盤面を停止','scripts/ui/Game.gd','BGM → Game → Result','AudioStreamPlayer: Finished Signalを接続','音源を末尾まで再生するとリザルトへ1度だけ遷移'),
('リザルト','得点、最大コンボ、判定、クイズ、ランクを表示','scripts/ui/Result.gd','Result / Content / ScrollContainer, Buttons','ランク閾値はGameBalance.RANKS、基準点は難易度のrank_target','NEW RECORDと再プレイ・楽曲選択・タイトルを表示'),
('セーブ・ハイスコア','楽曲×難易度別の成績と設定を永続化','scripts/SaveManager.gd','SaveManager（Autoload）','保存先 user://progress.cfg。tmpとbakを使用','低い記録でハイスコアを下げない。再読み込みで復元'),
('一時停止','ゲーム・音・入力・カウントダウンを停止','scripts/ui/ScreenBase.gd','Screen / Modal(CanvasLayer) / Overlay / Menu','Modal: Process Mode=Always。SceneTree.paused=true','メニュー・フォーカス喪失・バックグラウンドで停止。再開は明示操作'),
('演出・アニメーション','フェード、落下、拍リング、節目表示','scripts/ui/UI.gd','Screen / Content, PuzzleField','Fade=0.22秒。reduced_motion設定で抑制','画面切り替えと判定のフェード、ピース落下を表示'),
('iPhone向け調整','Safe Areaと画面比率、入力サイズに対応','scripts/ui/ScreenBase.gd','SafeArea(MarginContainer) / Center / Content','上下左右に余白。iOSはDisplayServerのSafe Areaを反映','390×844等のレイアウト検証済み。端末のノッチ・実測FPSは要確認'),
('iOS Export','iOS用プリセットと公式テンプレートを準備','export_presets.cfg','Project → Export → iOS','Team IDは未設定。Bundle Identifierは仮値。Export Project Only=On','署名情報入力後にXcode出力可能。現時点はTeam ID不足で未完了'),
('Web Export','single-threaded Web版を書き出し','export_presets.cfg','Project → Export → Web','Thread Support=Off, Extensions Support=Off, Canvas Resize Policy=Adaptive','WebGL 2.0ブラウザで起動・クイズ・音楽・入力・保存を検証'),
('最終デバッグ','データ・判定・入力・保存・フローを自動検証','tests/RunTests.gd','RunTests（テスト専用Scene）','ネイティブはF6またはCLI、Web QAはStartボタン','3,303チェック成功。実機署名とiPhone実測は未検証')
]
signals = {
  3: 'Start.pressed → Title._start → GameData.go', 4:'Button.pressed → _switch / _select / _preview',
  5:'GenreButton.pressed → _choose', 6:'AnswerButton.pressed → _answer、NextButton.pressed → _next',
  7:'SceneTreeTimer.timeout → _run_countdownの再開', 10:'PuzzleField.chain_changed → Game._on_chain_changed',
  11:'ClearButton.pressed → PuzzleField.clear_chain', 12:'BGM.finished → MusicManager._on_finished',
  14:'PuzzleField.piece_pressed → Game._on_piece_pressed → ScoreManager.apply_hit、note_missed → Game._on_note_missed',
  17:'MusicManager.song_finished → Game._finish', 19:'SaveManager.save_failed（拡張用）',
  20:'MenuButton.pressed → show_pause、Resume.pressed → resume_game', 22:'Control.resized → _update_safe_area'
}
lines=['# 実装対応書\n', 'ユーザーの「完成まで作成してください」に従い、STEPごとの停止を解除して実装しました。設計図は保持し、指示書の先頭にユーザー訂正を追記しました。訂正を優先し、判定を指を離す瞬間から対象の丸を押す瞬間へ変更しました。リングは同時に1個、接続可能な丸からランダムに表示。BEGINNER=4拍、NORMAL=2拍、HARD=1拍。落下中やフレーム遅延時は古いノートをまとめて出さず、その回をスキップします。\n',
'UIは各Sceneに通常のLabel・Button・Containerとして保存されています。Text、Theme Overrides、Layoutの編集は実行画面に反映されます。bind_screen()は既存Nodeに操作処理を接続し、可変データを更新します。画面の再生成は行いません。各Dialogも保存済みのNodeを表示・非表示にするだけです。編集方法はEDITOR_GUIDE.md参照。パズル盤面のピースとリングだけはPuzzleManagerの描画で、エディタにも表示します。\n',
'## 既存コードの変更\n\n対象: project.godot（関数なし）。applicationセクションにメインScene・アイコン・QA用Sceneを設定し、autoload/input_devices/audio/guiを追加しました。理由: 起動・共有状態・日本語フォント・Web音声を有効にするため。元の縦画面・Compatibility設定は維持しています。変更後の設定全文はSOURCE_CODE.mdに収録しています。\n']
for n,(title,goal,path,nodes,settings,verify) in enumerate(steps,1):
    script_attach = '各Sceneの同名Rootへアタッチ済み。' if path.startswith('scripts/ui/') else 'Autoloadまたは生成コードから利用。手動アタッチは不要。'
    operation = f'FileSystemドックで `{path}` をダブルクリック。UIは対応するscenes/*.tscnを開き、2DビューとInspectorで編集。実行時の状態はSceneドックの「リモート」で確認。'
    if n in [23,24]: operation='「プロジェクト → エクスポート」から対象プリセットを選択。詳細はEXPORT.md参照。'
    lines += [f'\n## STEP {n}: {title}\n',f'### 1. 今回の目標\n\n{goal}。\n',f'### 2. Godot Editorで行う操作\n\n{operation}\n',f'### 3. Node構成\n\n`{nodes}`\n',f'### 4. Inspector設定\n\n{settings}。値はコードまたは設定ファイルで適用済みです。\n',f'### 5. 作成ファイル\n\n`{path}`。関連Sceneは `scenes/`、データは `resources/`。\n',f'### 6. 完成コード\n\n別冊 [SOURCE_CODE.md](SOURCE_CODE.md) に `{path}` の全文と全関連ファイルを省略なしで収録。実ファイルもそのまま編集可能です。\n',f'### 7. スクリプトのアタッチ先\n\n{script_attach}\n',f'### 8. Signal\n\n{signals.get(n,"このSTEP専用のSignal接続は不要。関連する接続はスクリプトに記載。")}。\n',f'### 9. 動作確認\n\n{verify}。\n',f'### 10. エラー確認\n\n{"Team ID未設定による書き出しエラーは未解消。署名情報を設定後に再確認してください。" if n==23 else "検証結果はVALIDATION.md参照。GodotのDebuggerでエラーを確認してください。素材変更後はFileSystemで再インポートし、JSONは4択・正答番号・10問以上の条件を確認します。"}\n']
(ROOT/'docs/IMPLEMENTATION.md').write_text(''.join(lines))
files=[ROOT/'project.godot', ROOT/'export_presets.cfg']
for directory,pattern in [('scenes','*.tscn'),('scripts','*.gd'),('resources','*.json'),('tests','*.gd'),('tests','*.tscn')]:
    files+=sorted((ROOT/directory).rglob(pattern))
source=['# 完成コード全文\n\nこのファイルは実装済みファイルから自動生成しています。コード・Scene・設定・ゲームデータを省略していません。編集後は `python3 tools/generate_docs.py` で更新できます。\n']
for file in files:
    lang={'.gd':'gdscript','.json':'json','.tscn':'ini','.cfg':'ini','.godot':'ini'}[file.suffix]
    source.append(f'\n## {file.relative_to(ROOT)}\n\n```{lang}\n{file.read_text().rstrip()}\n```\n')
(ROOT/'docs/SOURCE_CODE.md').write_text(''.join(source))
print('Generated implementation guide and full source appendix.')
