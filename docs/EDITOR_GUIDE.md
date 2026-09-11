# Godotエディタでの編集

UIは通常のシーンノードです。実行時にも同じノードを使用するため、編集後の再生成は不要です。

## 文字を変える

1. `scenes/Title.tscn` を開き、上部の「2D」を選びます。
2. シーンツリーの検索欄に `TitleText` と入力し、そのLabelを選びます。
3. Inspectorの「Text」を変更して保存します。
4. F6（現在のシーンを実行）で変更を確認できます。ゲーム全体はF5です。

| 変更したい場所 | Scene | 主なノード |
|---|---|---|
| タイトル、キャッチコピー | Title.tscn | TitleText、Tagline |
| 開始ボタン | Title.tscn | StartButton |
| 遊び方 | Title.tscn | HelpDialog内のHelpHeading、HelpStep1〜3、HelpTimingGuide |
| 設定 | Title.tscn | SettingsDialog内のVolumeLabel、OffsetLabel、MotionToggle |
| 楽曲選択 | MusicSelect.tscn | Heading、PlayButton、PreviewButton、Difficulty0〜2 |
| ジャンル選択 | QuizSelect.tscn | Heading、Genre0〜7 |
| 問題・選択肢の表示 | Quiz.tscn | QuestionText、AnswerText0〜3、QuestionCount |
| カウントダウン | Countdown.tscn | CountLabel、QuizSummary、BonusSummary |
| 得点・コンボ | Game.tscn | ScoreLabel、ComboLabel、Stats |
| ゲーム中の説明・ボタン | Game.tscn | Judgment、ChainLabel、ClearButton、ResetChainButton |
| リザルト | Result.tscn | TotalScore、RankLabel、各Value・Caption、ReplayButton |
| 一時停止 | 各Scene | PauseDialog内のLabel・Button |

DialogのCanvasLayerは初期状態ではVisibleが無効です。編集時に有効にすると2Dビューで確認できます。初期画面で表示したくない場合は保存前に無効へ戻します。

## フォント・配色・レイアウト

LabelやButtonを選び、Theme OverridesでFont Size、Colors、Stylesなどを変更します。シーンRootのThemeには共通の日本語フォントがあります。
VBoxContainer/HBoxContainerの中は、親Containerの並び順・Separation、各子のCustom Minimum SizeとContainer Sizingで配置します。自由配置のControlはLayoutのAnchors/Offsetsを使います。
画面全体の余白はSafeAreaのTheme Overrides / Constants / Margin、横幅の上限はRootのContent Max Widthです。スマートフォンでは端末のSafe Areaを加味します。

## 可変表示と状態ごとの文言

数字や曲名を更新するラベルのTextには置換用の名前が入っています。

- ScoreLabel: `{score}` → `得点：{score}`
- ComboLabel: `{combo}\nCOMBO`（実際のTextでは改行）
- VolumeLabel: `音量  {volume}%` → `音の大きさ {volume}%`
- QuestionCount: `{number} / 10` → `第{number}問 / 10問`

必要な置換部分を残して周囲の文章を変更できます。置換部分を削除すると固定の文章として表示されます。
「次の問題」と「リズムゲームへ」、判定成功・失敗、試聴中のボタンなど、状態に応じて変わる文言は各SceneのRootの「Display Text」に公開しています。正誤のStyleBoxはQuizの「Answer Styles」、判定色はGameの「Judgment Colors」で変更できます。

実際の70問の問題・解説は `resources/quiz/questions.json`、楽曲・難易度データは `resources/music/catalog.json` です。QuestionTextやSongTitleのノードはそのデータの表示場所・書式を編集するものです。

## ノードの追加・移動

通常のLabelや画像等を追加して保存すると実行時にも残ります。既存UIの配置・親Containerも変更できます。ただし、スクリプトが操作対象を見つけるための固有ノード名（TitleText、ScoreLabel、Answer0等）は保持してください。動作を持つボタンの追加にはSignalの接続が必要です。
GenreボタンのMetadata / genreは問題データのジャンル名です。新しいジャンルを追加する場合は問題を10問以上用意してからボタンを複製し、名前・Text・genreを設定してください。

パズル盤面はPuzzleFieldというControlです。ゲーム中に変わる48ピース・接続線・タイミングリングの描画はPuzzleManagerが担当します。盤面の位置・サイズはシーンのContainerで編集できます。
