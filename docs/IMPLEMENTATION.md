# 実装対応書
ユーザーの「完成まで作成してください」に従い、STEPごとの停止を解除して実装しました。設計図は保持し、指示書の先頭にユーザー訂正を追記しました。訂正を優先し、判定を指を離す瞬間から対象の丸を押す瞬間へ変更しました。リングは同時に1個、接続可能な丸からランダムに表示。BEGINNER=4拍、NORMAL=2拍、HARD=1拍。落下中やフレーム遅延時は古いノートをまとめて出さず、その回をスキップします。
UIは各Sceneに通常のLabel・Button・Containerとして保存されています。Text、Theme Overrides、Layoutの編集は実行画面に反映されます。bind_screen()は既存Nodeに操作処理を接続し、可変データを更新します。画面の再生成は行いません。各Dialogも保存済みのNodeを表示・非表示にするだけです。編集方法はEDITOR_GUIDE.md参照。パズル盤面のピースとリングだけはPuzzleManagerの描画で、エディタにも表示します。
## 既存コードの変更

対象: project.godot（関数なし）。applicationセクションにメインScene・アイコン・QA用Sceneを設定し、autoload/input_devices/audio/guiを追加しました。理由: 起動・共有状態・日本語フォント・Web音声を有効にするため。元の縦画面・Compatibility設定は維持しています。変更後の設定全文はSOURCE_CODE.mdに収録しています。

## STEP 1: プロジェクト設定
### 1. 今回の目標

縦画面・60FPS上限・Compatibilityを設定。
### 2. Godot Editorで行う操作

FileSystemドックで `project.godot` をダブルクリック。UIは対応するscenes/*.tscnを開き、2DビューとInspectorで編集。実行時の状態はSceneドックの「リモート」で確認。
### 3. Node構成

`ProjectSettings`
### 4. Inspector設定

Display/Window: 390×844, canvas_items, expand, Portrait。Application/Run/Max FPS: 60。値はコードまたは設定ファイルで適用済みです。
### 5. 作成ファイル

`project.godot`。関連Sceneは `scenes/`、データは `resources/`。
### 6. 完成コード

別冊 [SOURCE_CODE.md](SOURCE_CODE.md) に `project.godot` の全文と全関連ファイルを省略なしで収録。実ファイルもそのまま編集可能です。
### 7. スクリプトのアタッチ先

Autoloadまたは生成コードから利用。手動アタッチは不要。
### 8. Signal

このSTEP専用のSignal接続は不要。関連する接続はスクリプトに記載。。
### 9. 動作確認

設定値を確認しF5でタイトルが起動する。
### 10. エラー確認

検証結果はVALIDATION.md参照。GodotのDebuggerでエラーを確認してください。素材変更後はFileSystemで再インポートし、JSONは4択・正答番号・10問以上の条件を確認します。

## STEP 2: Scene・Autoload構成
### 1. 今回の目標

7画面と共有データを分離。
### 2. Godot Editorで行う操作

FileSystemドックで `scripts/GameData.gd` をダブルクリック。UIは対応するscenes/*.tscnを開き、2DビューとInspectorで編集。実行時の状態はSceneドックの「リモート」で確認。
### 3. Node構成

`Root / SaveManager, GameData, MusicManager`
### 4. Inspector設定

Project → Project Settings → Globals → Autoload: 3件を有効化（設定済み）。値はコードまたは設定ファイルで適用済みです。
### 5. 作成ファイル

`scripts/GameData.gd`。関連Sceneは `scenes/`、データは `resources/`。
### 6. 完成コード

別冊 [SOURCE_CODE.md](SOURCE_CODE.md) に `scripts/GameData.gd` の全文と全関連ファイルを省略なしで収録。実ファイルもそのまま編集可能です。
### 7. スクリプトのアタッチ先

Autoloadまたは生成コードから利用。手動アタッチは不要。
### 8. Signal

このSTEP専用のSignal接続は不要。関連する接続はスクリプトに記載。。
### 9. 動作確認

Scene遷移後も選択した曲・難易度を保持。
### 10. エラー確認

検証結果はVALIDATION.md参照。GodotのDebuggerでエラーを確認してください。素材変更後はFileSystemで再インポートし、JSONは4択・正答番号・10問以上の条件を確認します。

## STEP 3: タイトル画面
### 1. 今回の目標

スタート・遊び方・設定を表示。
### 2. Godot Editorで行う操作

FileSystemドックで `scripts/ui/Title.gd` をダブルクリック。UIは対応するscenes/*.tscnを開き、2DビューとInspectorで編集。実行時の状態はSceneドックの「リモート」で確認。
### 3. Node構成

`Title / SafeArea / Center / Content`
### 4. Inspector設定

Title: Layout=Full Rect。Background: Color=f6f5f0。値はコードまたは設定ファイルで適用済みです。
### 5. 作成ファイル

`scripts/ui/Title.gd`。関連Sceneは `scenes/`、データは `resources/`。
### 6. 完成コード

別冊 [SOURCE_CODE.md](SOURCE_CODE.md) に `scripts/ui/Title.gd` の全文と全関連ファイルを省略なしで収録。実ファイルもそのまま編集可能です。
### 7. スクリプトのアタッチ先

各Sceneの同名Rootへアタッチ済み。
### 8. Signal

Start.pressed → Title._start → GameData.go。
### 9. 動作確認

スタートから楽曲選択へ。iOS/Webでは終了ボタンを非表示。
### 10. エラー確認

検証結果はVALIDATION.md参照。GodotのDebuggerでエラーを確認してください。素材変更後はFileSystemで再インポートし、JSONは4択・正答番号・10問以上の条件を確認します。

## STEP 4: ミュージック選択
### 1. 今回の目標

ジャケット、試聴、難易度、記録を表示。
### 2. Godot Editorで行う操作

FileSystemドックで `scripts/ui/MusicSelect.gd` をダブルクリック。UIは対応するscenes/*.tscnを開き、2DビューとInspectorで編集。実行時の状態はSceneドックの「リモート」で確認。
### 3. Node構成

`MusicSelect / Content / ScrollContainer`
### 4. Inspector設定

ジャケット: Expand Ignore Size, Keep Aspect Centered。左右ボタン: 最小44px。値はコードまたは設定ファイルで適用済みです。
### 5. 作成ファイル

`scripts/ui/MusicSelect.gd`。関連Sceneは `scenes/`、データは `resources/`。
### 6. 完成コード

別冊 [SOURCE_CODE.md](SOURCE_CODE.md) に `scripts/ui/MusicSelect.gd` の全文と全関連ファイルを省略なしで収録。実ファイルもそのまま編集可能です。
### 7. スクリプトのアタッチ先

各Sceneの同名Rootへアタッチ済み。
### 8. Signal

Button.pressed → _switch / _select / _preview。
### 9. 動作確認

3曲を切り替え、難易度別の記録が切り替わる。
### 10. エラー確認

検証結果はVALIDATION.md参照。GodotのDebuggerでエラーを確認してください。素材変更後はFileSystemで再インポートし、JSONは4択・正答番号・10問以上の条件を確認します。

## STEP 5: クイズ選択
### 1. 今回の目標

シーン内のジャンルボタンをデータへ接続。
### 2. Godot Editorで行う操作

FileSystemドックで `scripts/ui/QuizSelect.gd` をダブルクリック。UIは対応するscenes/*.tscnを開き、2DビューとInspectorで編集。実行時の状態はSceneドックの「リモート」で確認。
### 3. Node構成

`QuizSelect / Content / ScrollContainer`
### 4. Inspector設定

ボタン: 最小高さ52px。Scroll: Horizontal Disabled。値はコードまたは設定ファイルで適用済みです。
### 5. 作成ファイル

`scripts/ui/QuizSelect.gd`。関連Sceneは `scenes/`、データは `resources/`。
### 6. 完成コード

別冊 [SOURCE_CODE.md](SOURCE_CODE.md) に `scripts/ui/QuizSelect.gd` の全文と全関連ファイルを省略なしで収録。実ファイルもそのまま編集可能です。
### 7. スクリプトのアタッチ先

各Sceneの同名Rootへアタッチ済み。
### 8. Signal

GenreButton.pressed → _choose。
### 9. 動作確認

7ジャンルと全ジャンルが選べる。
### 10. エラー確認

検証結果はVALIDATION.md参照。GodotのDebuggerでエラーを確認してください。素材変更後はFileSystemで再インポートし、JSONは4択・正答番号・10問以上の条件を確認します。

## STEP 6: 4択クイズ
### 1. 今回の目標

重複なし10問、正誤と解説を表示。
### 2. Godot Editorで行う操作

FileSystemドックで `scripts/ui/Quiz.gd` をダブルクリック。UIは対応するscenes/*.tscnを開き、2DビューとInspectorで編集。実行時の状態はSceneドックの「リモート」で確認。
### 3. Node構成

`Quiz / Content / ProgressBar, ScrollContainer, Footer`
### 4. Inspector設定

回答ボタン: 最小高さ60px。ProgressBar: Max Value=10。値はコードまたは設定ファイルで適用済みです。
### 5. 作成ファイル

`scripts/ui/Quiz.gd`。関連Sceneは `scenes/`、データは `resources/`。
### 6. 完成コード

別冊 [SOURCE_CODE.md](SOURCE_CODE.md) に `scripts/ui/Quiz.gd` の全文と全関連ファイルを省略なしで収録。実ファイルもそのまま編集可能です。
### 7. スクリプトのアタッチ先

各Sceneの同名Rootへアタッチ済み。
### 8. Signal

AnswerButton.pressed → _answer、NextButton.pressed → _next。
### 9. 動作確認

連続タップしても1問につき1回答、回答後に次ボタンを表示。
### 10. エラー確認

検証結果はVALIDATION.md参照。GodotのDebuggerでエラーを確認してください。素材変更後はFileSystemで再インポートし、JSONは4択・正答番号・10問以上の条件を確認します。

## STEP 7: クイズ終了・カウントダウン
### 1. 今回の目標

クイズ成績を保存し3秒待って開始。
### 2. Godot Editorで行う操作

FileSystemドックで `scripts/ui/Countdown.gd` をダブルクリック。UIは対応するscenes/*.tscnを開き、2DビューとInspectorで編集。実行時の状態はSceneドックの「リモート」で確認。
### 3. Node構成

`Countdown / Content / CountLabel`
### 4. Inspector設定

Timer: process_always=false（コード生成）。Pause可能。値はコードまたは設定ファイルで適用済みです。
### 5. 作成ファイル

`scripts/ui/Countdown.gd`。関連Sceneは `scenes/`、データは `resources/`。
### 6. 完成コード

別冊 [SOURCE_CODE.md](SOURCE_CODE.md) に `scripts/ui/Countdown.gd` の全文と全関連ファイルを省略なしで収録。実ファイルもそのまま編集可能です。
### 7. スクリプトのアタッチ先

各Sceneの同名Rootへアタッチ済み。
### 8. Signal

SceneTreeTimer.timeout → _run_countdownの再開。
### 9. 動作確認

3→2→1→START。待機中は音楽・盤面を開始しない。
### 10. エラー確認

検証結果はVALIDATION.md参照。GodotのDebuggerでエラーを確認してください。素材変更後はFileSystemで再インポートし、JSONは4択・正答番号・10問以上の条件を確認します。

## STEP 8: ゲーム画面UI
### 1. 今回の目標

ジャケット・曲・コンボ・盤面・判定を配置。
### 2. Godot Editorで行う操作

FileSystemドックで `scripts/ui/Game.gd` をダブルクリック。UIは対応するscenes/*.tscnを開き、2DビューとInspectorで編集。実行時の状態はSceneドックの「リモート」で確認。
### 3. Node構成

`Game / Content / Header, PuzzleField, Actions, Stats`
### 4. Inspector設定

PuzzleField: Vertical Expand Fill, 最小高さ320px。値はコードまたは設定ファイルで適用済みです。
### 5. 作成ファイル

`scripts/ui/Game.gd`。関連Sceneは `scenes/`、データは `resources/`。
### 6. 完成コード

別冊 [SOURCE_CODE.md](SOURCE_CODE.md) に `scripts/ui/Game.gd` の全文と全関連ファイルを省略なしで収録。実ファイルもそのまま編集可能です。
### 7. スクリプトのアタッチ先

各Sceneの同名Rootへアタッチ済み。
### 8. Signal

このSTEP専用のSignal接続は不要。関連する接続はスクリプトに記載。。
### 9. 動作確認

得点、残り時間、判定回数を表示。
### 10. エラー確認

検証結果はVALIDATION.md参照。GodotのDebuggerでエラーを確認してください。素材変更後はFileSystemで再インポートし、JSONは4択・正答番号・10問以上の条件を確認します。

## STEP 9: ピース生成
### 1. 今回の目標

48個の丸いピースを安定配置。
### 2. Godot Editorで行う操作

FileSystemドックで `scripts/PuzzleManager.gd` をダブルクリック。UIは対応するscenes/*.tscnを開き、2DビューとInspectorで編集。実行時の状態はSceneドックの「リモート」で確認。
### 3. Node構成

`Game / Content / PuzzleField`
### 4. Inspector設定

列6、行8。色数はcatalog.jsonのdifficulties.colors。値はコードまたは設定ファイルで適用済みです。
### 5. 作成ファイル

`scripts/PuzzleManager.gd`。関連Sceneは `scenes/`、データは `resources/`。
### 6. 完成コード

別冊 [SOURCE_CODE.md](SOURCE_CODE.md) に `scripts/PuzzleManager.gd` の全文と全関連ファイルを省略なしで収録。実ファイルもそのまま編集可能です。
### 7. スクリプトのアタッチ先

Autoloadまたは生成コードから利用。手動アタッチは不要。
### 8. Signal

このSTEP専用のSignal接続は不要。関連する接続はスクリプトに記載。。
### 9. 動作確認

色と記号で区別した丸が下側に集まる。
### 10. エラー確認

検証結果はVALIDATION.md参照。GodotのDebuggerでエラーを確認してください。素材変更後はFileSystemで再インポートし、JSONは4択・正答番号・10問以上の条件を確認します。

## STEP 10: 同色接続
### 1. 今回の目標

マウス・タッチの押下で同色接続と後戻り。
### 2. Godot Editorで行う操作

FileSystemドックで `scripts/PuzzleManager.gd` をダブルクリック。UIは対応するscenes/*.tscnを開き、2DビューとInspectorで編集。実行時の状態はSceneドックの「リモート」で確認。
### 3. Node構成

`PuzzleField / ConnectionLine`
### 4. Inspector設定

Line2D: Width=7, Round Cap, Antialiased=On。値はコードまたは設定ファイルで適用済みです。
### 5. 作成ファイル

`scripts/PuzzleManager.gd`。関連Sceneは `scenes/`、データは `resources/`。
### 6. 完成コード

別冊 [SOURCE_CODE.md](SOURCE_CODE.md) に `scripts/PuzzleManager.gd` の全文と全関連ファイルを省略なしで収録。実ファイルもそのまま編集可能です。
### 7. スクリプトのアタッチ先

Autoloadまたは生成コードから利用。手動アタッチは不要。
### 8. Signal

PuzzleField.chain_changed → Game._on_chain_changed。
### 9. 動作確認

同色・距離条件を満たすピースのみつながる。1つ前へ戻れる。
### 10. エラー確認

検証結果はVALIDATION.md参照。GodotのDebuggerでエラーを確認してください。素材変更後はFileSystemで再インポートし、JSONは4択・正答番号・10問以上の条件を確認します。

## STEP 11: 削除・落下・補充
### 1. 今回の目標

3個以上つないで消すボタンで削除・補充。
### 2. Godot Editorで行う操作

FileSystemドックで `scripts/PuzzleManager.gd` をダブルクリック。UIは対応するscenes/*.tscnを開き、2DビューとInspectorで編集。実行時の状態はSceneドックの「リモート」で確認。
### 3. Node構成

`PuzzleField（ピースはRefCountedデータ）`
### 4. Inspector設定

GameBalance: MIN_CHAIN=3, FALL_SPEED=12。値はコードまたは設定ファイルで適用済みです。
### 5. 作成ファイル

`scripts/PuzzleManager.gd`。関連Sceneは `scenes/`、データは `resources/`。
### 6. 完成コード

別冊 [SOURCE_CODE.md](SOURCE_CODE.md) に `scripts/PuzzleManager.gd` の全文と全関連ファイルを省略なしで収録。実ファイルもそのまま編集可能です。
### 7. スクリプトのアタッチ先

Autoloadまたは生成コードから利用。手動アタッチは不要。
### 8. Signal

ClearButton.pressed → PuzzleField.clear_chain。
### 9. 動作確認

48個を維持し、上のピースが落下。手詰まり時に接続を保証。
### 10. エラー確認

検証結果はVALIDATION.md参照。GodotのDebuggerでエラーを確認してください。素材変更後はFileSystemで再インポートし、JSONは4択・正答番号・10問以上の条件を確認します。

## STEP 12: BGM再生
### 1. 今回の目標

実音源を再生し、ユーザー操作で音声を有効化。
### 2. Godot Editorで行う操作

FileSystemドックで `scripts/MusicManager.gd` をダブルクリック。UIは対応するscenes/*.tscnを開き、2DビューとInspectorで編集。実行時の状態はSceneドックの「リモート」で確認。
### 3. Node構成

`MusicManager / BGM`
### 4. Inspector設定

AudioStreamPlayer: Playback Type=Stream, Bus=Master。値はコードまたは設定ファイルで適用済みです。
### 5. 作成ファイル

`scripts/MusicManager.gd`。関連Sceneは `scenes/`、データは `resources/`。
### 6. 完成コード

別冊 [SOURCE_CODE.md](SOURCE_CODE.md) に `scripts/MusicManager.gd` の全文と全関連ファイルを省略なしで収録。実ファイルもそのまま編集可能です。
### 7. スクリプトのアタッチ先

Autoloadまたは生成コードから利用。手動アタッチは不要。
### 8. Signal

BGM.finished → MusicManager._on_finished。
### 9. 動作確認

3曲を試聴でき、カウントダウン後に選択曲が鳴る。
### 10. エラー確認

検証結果はVALIDATION.md参照。GodotのDebuggerでエラーを確認してください。素材変更後はFileSystemで再インポートし、JSONは4択・正答番号・10問以上の条件を確認します。

## STEP 13: BPM同期
### 1. 今回の目標

音声の再生位置に同期し、RhythmSchedulerで4／2／1拍ごとに対象を抽選。
### 2. Godot Editorで行う操作

FileSystemドックで `scripts/MusicManager.gd` をダブルクリック。UIは対応するscenes/*.tscnを開き、2DビューとInspectorで編集。実行時の状態はSceneドックの「リモート」で確認。
### 3. Node構成

`MusicManager / BGM, Game / PuzzleFieldの選ばれた1個の丸`
### 4. Inspector設定

catalog.json: bpm, beat_offset, difficulties.note_interval_beats。Settings: offset_ms。値はコードまたは設定ファイルで適用済みです。
### 5. 作成ファイル

`scripts/MusicManager.gd`。関連Sceneは `scenes/`、データは `resources/`。
### 6. 完成コード

別冊 [SOURCE_CODE.md](SOURCE_CODE.md) に `scripts/MusicManager.gd` の全文と全関連ファイルを省略なしで収録。実ファイルもそのまま編集可能です。
### 7. スクリプトのアタッチ先

Autoloadまたは生成コードから利用。手動アタッチは不要。
### 8. Signal

このSTEP専用のSignal接続は不要。関連する接続はスクリプトに記載。。
### 9. 動作確認

get_playback_position＋last mix−output latencyで時刻を取得。
### 10. エラー確認

検証結果はVALIDATION.md参照。GodotのDebuggerでエラーを確認してください。素材変更後はFileSystemで再インポートし、JSONは4択・正答番号・10問以上の条件を確認します。

## STEP 14: タイミング判定
### 1. 今回の目標

対象の丸を押した瞬間と、そのリングの予定拍を比較。
### 2. Godot Editorで行う操作

FileSystemドックで `scripts/GameBalance.gd` をダブルクリック。UIは対応するscenes/*.tscnを開き、2DビューとInspectorで編集。実行時の状態はSceneドックの「リモート」で確認。
### 3. Node構成

`PuzzleField → Game`
### 4. Inspector設定

PERFECT_WINDOW=0.080, GOOD_WINDOW=0.180。値はコードまたは設定ファイルで適用済みです。
### 5. 作成ファイル

`scripts/GameBalance.gd`。関連Sceneは `scenes/`、データは `resources/`。
### 6. 完成コード

別冊 [SOURCE_CODE.md](SOURCE_CODE.md) に `scripts/GameBalance.gd` の全文と全関連ファイルを省略なしで収録。実ファイルもそのまま編集可能です。
### 7. スクリプトのアタッチ先

Autoloadまたは生成コードから利用。手動アタッチは不要。
### 8. Signal

PuzzleField.piece_pressed → Game._on_piece_pressed → ScoreManager.apply_hit、note_missed → Game._on_note_missed。
### 9. 動作確認

±80msと±180msの境界を含めて正しく判定。
### 10. エラー確認

検証結果はVALIDATION.md参照。GodotのDebuggerでエラーを確認してください。素材変更後はFileSystemで再インポートし、JSONは4択・正答番号・10問以上の条件を確認します。

## STEP 15: スコア
### 1. 今回の目標

ピース・判定・チェーン・コンボ・クイズ倍率を合成。
### 2. Godot Editorで行う操作

FileSystemドックで `scripts/ScoreManager.gd` をダブルクリック。UIは対応するscenes/*.tscnを開き、2DビューとInspectorで編集。実行時の状態はSceneドックの「リモート」で確認。
### 3. Node構成

`Game / ScoreLabel`
### 4. Inspector設定

POINTS_PER_PIECE=100。倍率はGameBalanceへ集約。値はコードまたは設定ファイルで適用済みです。
### 5. 作成ファイル

`scripts/ScoreManager.gd`。関連Sceneは `scenes/`、データは `resources/`。
### 6. 完成コード

別冊 [SOURCE_CODE.md](SOURCE_CODE.md) に `scripts/ScoreManager.gd` の全文と全関連ファイルを省略なしで収録。実ファイルもそのまま編集可能です。
### 7. スクリプトのアタッチ先

Autoloadまたは生成コードから利用。手動アタッチは不要。
### 8. Signal

このSTEP専用のSignal接続は不要。関連する接続はスクリプトに記載。。
### 9. 動作確認

各ピースを押した瞬間に1回加点。指を離しても判定せず、接続を保持。
### 10. エラー確認

検証結果はVALIDATION.md参照。GodotのDebuggerでエラーを確認してください。素材変更後はFileSystemで再インポートし、JSONは4択・正答番号・10問以上の条件を確認します。

## STEP 16: コンボ・チェーン
### 1. 今回の目標

GOOD以上の連続成功と長い接続を評価。
### 2. Godot Editorで行う操作

FileSystemドックで `scripts/ScoreManager.gd` をダブルクリック。UIは対応するscenes/*.tscnを開き、2DビューとInspectorで編集。実行時の状態はSceneドックの「リモート」で確認。
### 3. Node構成

`Game / ComboLabel, Judgment`
### 4. Inspector設定

MILESTONES=[50,100,200], LONG_CHAIN=7。値はコードまたは設定ファイルで適用済みです。
### 5. 作成ファイル

`scripts/ScoreManager.gd`。関連Sceneは `scenes/`、データは `resources/`。
### 6. 完成コード

別冊 [SOURCE_CODE.md](SOURCE_CODE.md) に `scripts/ScoreManager.gd` の全文と全関連ファイルを省略なしで収録。実ファイルもそのまま編集可能です。
### 7. スクリプトのアタッチ先

Autoloadまたは生成コードから利用。手動アタッチは不要。
### 8. Signal

このSTEP専用のSignal接続は不要。関連する接続はスクリプトに記載。。
### 9. 動作確認

MISSでコンボを0にし、最大コンボは保持。
### 10. エラー確認

検証結果はVALIDATION.md参照。GodotのDebuggerでエラーを確認してください。素材変更後はFileSystemで再インポートし、JSONは4択・正答番号・10問以上の条件を確認します。

## STEP 17: ゲーム終了
### 1. 今回の目標

曲の終了で盤面を停止。
### 2. Godot Editorで行う操作

FileSystemドックで `scripts/ui/Game.gd` をダブルクリック。UIは対応するscenes/*.tscnを開き、2DビューとInspectorで編集。実行時の状態はSceneドックの「リモート」で確認。
### 3. Node構成

`BGM → Game → Result`
### 4. Inspector設定

AudioStreamPlayer: Finished Signalを接続。値はコードまたは設定ファイルで適用済みです。
### 5. 作成ファイル

`scripts/ui/Game.gd`。関連Sceneは `scenes/`、データは `resources/`。
### 6. 完成コード

別冊 [SOURCE_CODE.md](SOURCE_CODE.md) に `scripts/ui/Game.gd` の全文と全関連ファイルを省略なしで収録。実ファイルもそのまま編集可能です。
### 7. スクリプトのアタッチ先

各Sceneの同名Rootへアタッチ済み。
### 8. Signal

MusicManager.song_finished → Game._finish。
### 9. 動作確認

音源を末尾まで再生するとリザルトへ1度だけ遷移。
### 10. エラー確認

検証結果はVALIDATION.md参照。GodotのDebuggerでエラーを確認してください。素材変更後はFileSystemで再インポートし、JSONは4択・正答番号・10問以上の条件を確認します。

## STEP 18: リザルト
### 1. 今回の目標

得点、最大コンボ、判定、クイズ、ランクを表示。
### 2. Godot Editorで行う操作

FileSystemドックで `scripts/ui/Result.gd` をダブルクリック。UIは対応するscenes/*.tscnを開き、2DビューとInspectorで編集。実行時の状態はSceneドックの「リモート」で確認。
### 3. Node構成

`Result / Content / ScrollContainer, Buttons`
### 4. Inspector設定

ランク閾値はGameBalance.RANKS、基準点は難易度のrank_target。値はコードまたは設定ファイルで適用済みです。
### 5. 作成ファイル

`scripts/ui/Result.gd`。関連Sceneは `scenes/`、データは `resources/`。
### 6. 完成コード

別冊 [SOURCE_CODE.md](SOURCE_CODE.md) に `scripts/ui/Result.gd` の全文と全関連ファイルを省略なしで収録。実ファイルもそのまま編集可能です。
### 7. スクリプトのアタッチ先

各Sceneの同名Rootへアタッチ済み。
### 8. Signal

このSTEP専用のSignal接続は不要。関連する接続はスクリプトに記載。。
### 9. 動作確認

NEW RECORDと再プレイ・楽曲選択・タイトルを表示。
### 10. エラー確認

検証結果はVALIDATION.md参照。GodotのDebuggerでエラーを確認してください。素材変更後はFileSystemで再インポートし、JSONは4択・正答番号・10問以上の条件を確認します。

## STEP 19: セーブ・ハイスコア
### 1. 今回の目標

楽曲×難易度別の成績と設定を永続化。
### 2. Godot Editorで行う操作

FileSystemドックで `scripts/SaveManager.gd` をダブルクリック。UIは対応するscenes/*.tscnを開き、2DビューとInspectorで編集。実行時の状態はSceneドックの「リモート」で確認。
### 3. Node構成

`SaveManager（Autoload）`
### 4. Inspector設定

保存先 user://progress.cfg。tmpとbakを使用。値はコードまたは設定ファイルで適用済みです。
### 5. 作成ファイル

`scripts/SaveManager.gd`。関連Sceneは `scenes/`、データは `resources/`。
### 6. 完成コード

別冊 [SOURCE_CODE.md](SOURCE_CODE.md) に `scripts/SaveManager.gd` の全文と全関連ファイルを省略なしで収録。実ファイルもそのまま編集可能です。
### 7. スクリプトのアタッチ先

Autoloadまたは生成コードから利用。手動アタッチは不要。
### 8. Signal

SaveManager.save_failed（拡張用）。
### 9. 動作確認

低い記録でハイスコアを下げない。再読み込みで復元。
### 10. エラー確認

検証結果はVALIDATION.md参照。GodotのDebuggerでエラーを確認してください。素材変更後はFileSystemで再インポートし、JSONは4択・正答番号・10問以上の条件を確認します。

## STEP 20: 一時停止
### 1. 今回の目標

ゲーム・音・入力・カウントダウンを停止。
### 2. Godot Editorで行う操作

FileSystemドックで `scripts/ui/ScreenBase.gd` をダブルクリック。UIは対応するscenes/*.tscnを開き、2DビューとInspectorで編集。実行時の状態はSceneドックの「リモート」で確認。
### 3. Node構成

`Screen / Modal(CanvasLayer) / Overlay / Menu`
### 4. Inspector設定

Modal: Process Mode=Always。SceneTree.paused=true。値はコードまたは設定ファイルで適用済みです。
### 5. 作成ファイル

`scripts/ui/ScreenBase.gd`。関連Sceneは `scenes/`、データは `resources/`。
### 6. 完成コード

別冊 [SOURCE_CODE.md](SOURCE_CODE.md) に `scripts/ui/ScreenBase.gd` の全文と全関連ファイルを省略なしで収録。実ファイルもそのまま編集可能です。
### 7. スクリプトのアタッチ先

各Sceneの同名Rootへアタッチ済み。
### 8. Signal

MenuButton.pressed → show_pause、Resume.pressed → resume_game。
### 9. 動作確認

メニュー・フォーカス喪失・バックグラウンドで停止。再開は明示操作。
### 10. エラー確認

検証結果はVALIDATION.md参照。GodotのDebuggerでエラーを確認してください。素材変更後はFileSystemで再インポートし、JSONは4択・正答番号・10問以上の条件を確認します。

## STEP 21: 演出・アニメーション
### 1. 今回の目標

フェード、落下、拍リング、節目表示。
### 2. Godot Editorで行う操作

FileSystemドックで `scripts/ui/UI.gd` をダブルクリック。UIは対応するscenes/*.tscnを開き、2DビューとInspectorで編集。実行時の状態はSceneドックの「リモート」で確認。
### 3. Node構成

`Screen / Content, PuzzleField`
### 4. Inspector設定

Fade=0.22秒。reduced_motion設定で抑制。値はコードまたは設定ファイルで適用済みです。
### 5. 作成ファイル

`scripts/ui/UI.gd`。関連Sceneは `scenes/`、データは `resources/`。
### 6. 完成コード

別冊 [SOURCE_CODE.md](SOURCE_CODE.md) に `scripts/ui/UI.gd` の全文と全関連ファイルを省略なしで収録。実ファイルもそのまま編集可能です。
### 7. スクリプトのアタッチ先

各Sceneの同名Rootへアタッチ済み。
### 8. Signal

このSTEP専用のSignal接続は不要。関連する接続はスクリプトに記載。。
### 9. 動作確認

画面切り替えと判定のフェード、ピース落下を表示。
### 10. エラー確認

検証結果はVALIDATION.md参照。GodotのDebuggerでエラーを確認してください。素材変更後はFileSystemで再インポートし、JSONは4択・正答番号・10問以上の条件を確認します。

## STEP 22: iPhone向け調整
### 1. 今回の目標

Safe Areaと画面比率、入力サイズに対応。
### 2. Godot Editorで行う操作

FileSystemドックで `scripts/ui/ScreenBase.gd` をダブルクリック。UIは対応するscenes/*.tscnを開き、2DビューとInspectorで編集。実行時の状態はSceneドックの「リモート」で確認。
### 3. Node構成

`SafeArea(MarginContainer) / Center / Content`
### 4. Inspector設定

上下左右に余白。iOSはDisplayServerのSafe Areaを反映。値はコードまたは設定ファイルで適用済みです。
### 5. 作成ファイル

`scripts/ui/ScreenBase.gd`。関連Sceneは `scenes/`、データは `resources/`。
### 6. 完成コード

別冊 [SOURCE_CODE.md](SOURCE_CODE.md) に `scripts/ui/ScreenBase.gd` の全文と全関連ファイルを省略なしで収録。実ファイルもそのまま編集可能です。
### 7. スクリプトのアタッチ先

各Sceneの同名Rootへアタッチ済み。
### 8. Signal

Control.resized → _update_safe_area。
### 9. 動作確認

390×844等のレイアウト検証済み。端末のノッチ・実測FPSは要確認。
### 10. エラー確認

検証結果はVALIDATION.md参照。GodotのDebuggerでエラーを確認してください。素材変更後はFileSystemで再インポートし、JSONは4択・正答番号・10問以上の条件を確認します。

## STEP 23: iOS Export
### 1. 今回の目標

iOS用プリセットと公式テンプレートを準備。
### 2. Godot Editorで行う操作

「プロジェクト → エクスポート」から対象プリセットを選択。詳細はEXPORT.md参照。
### 3. Node構成

`Project → Export → iOS`
### 4. Inspector設定

Team IDは未設定。Bundle Identifierは仮値。Export Project Only=On。値はコードまたは設定ファイルで適用済みです。
### 5. 作成ファイル

`export_presets.cfg`。関連Sceneは `scenes/`、データは `resources/`。
### 6. 完成コード

別冊 [SOURCE_CODE.md](SOURCE_CODE.md) に `export_presets.cfg` の全文と全関連ファイルを省略なしで収録。実ファイルもそのまま編集可能です。
### 7. スクリプトのアタッチ先

Autoloadまたは生成コードから利用。手動アタッチは不要。
### 8. Signal

このSTEP専用のSignal接続は不要。関連する接続はスクリプトに記載。。
### 9. 動作確認

署名情報入力後にXcode出力可能。現時点はTeam ID不足で未完了。
### 10. エラー確認

Team ID未設定による書き出しエラーは未解消。署名情報を設定後に再確認してください。

## STEP 24: Web Export
### 1. 今回の目標

single-threaded Web版を書き出し。
### 2. Godot Editorで行う操作

「プロジェクト → エクスポート」から対象プリセットを選択。詳細はEXPORT.md参照。
### 3. Node構成

`Project → Export → Web`
### 4. Inspector設定

Thread Support=Off, Extensions Support=Off, Canvas Resize Policy=Adaptive。値はコードまたは設定ファイルで適用済みです。
### 5. 作成ファイル

`export_presets.cfg`。関連Sceneは `scenes/`、データは `resources/`。
### 6. 完成コード

別冊 [SOURCE_CODE.md](SOURCE_CODE.md) に `export_presets.cfg` の全文と全関連ファイルを省略なしで収録。実ファイルもそのまま編集可能です。
### 7. スクリプトのアタッチ先

Autoloadまたは生成コードから利用。手動アタッチは不要。
### 8. Signal

このSTEP専用のSignal接続は不要。関連する接続はスクリプトに記載。。
### 9. 動作確認

WebGL 2.0ブラウザで起動・クイズ・音楽・入力・保存を検証。
### 10. エラー確認

検証結果はVALIDATION.md参照。GodotのDebuggerでエラーを確認してください。素材変更後はFileSystemで再インポートし、JSONは4択・正答番号・10問以上の条件を確認します。

## STEP 25: 最終デバッグ
### 1. 今回の目標

データ・判定・入力・保存・フローを自動検証。
### 2. Godot Editorで行う操作

FileSystemドックで `tests/RunTests.gd` をダブルクリック。UIは対応するscenes/*.tscnを開き、2DビューとInspectorで編集。実行時の状態はSceneドックの「リモート」で確認。
### 3. Node構成

`RunTests（テスト専用Scene）`
### 4. Inspector設定

ネイティブはF6またはCLI、Web QAはStartボタン。値はコードまたは設定ファイルで適用済みです。
### 5. 作成ファイル

`tests/RunTests.gd`。関連Sceneは `scenes/`、データは `resources/`。
### 6. 完成コード

別冊 [SOURCE_CODE.md](SOURCE_CODE.md) に `tests/RunTests.gd` の全文と全関連ファイルを省略なしで収録。実ファイルもそのまま編集可能です。
### 7. スクリプトのアタッチ先

Autoloadまたは生成コードから利用。手動アタッチは不要。
### 8. Signal

このSTEP専用のSignal接続は不要。関連する接続はスクリプトに記載。。
### 9. 動作確認

3,303チェック成功。実機署名とiPhone実測は未検証。
### 10. エラー確認

検証結果はVALIDATION.md参照。GodotのDebuggerでエラーを確認してください。素材変更後はFileSystemで再インポートし、JSONは4択・正答番号・10問以上の条件を確認します。
