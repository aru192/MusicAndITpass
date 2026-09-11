# BIT / BEAT

ITパスポートの4択クイズ × 同色タップ接続パズル × 音楽ゲーム。
Godot **4.7.2 Standard** / GDScript / Compatibility / 縦画面。

## 起動

Godotのプロジェクトマネージャーで、このフォルダの `project.godot` をインポートし、**F5** を押してください。
Scene、Autoload、Signalは設定済みです。手作業でNodeを追加する必要はありません。

Web書き出し済みファイルは `build/web/index.html` です。ファイルのダブルクリックではなくHTTPサーバーで開きます。

```sh
python3 -m http.server 8765 --bind 127.0.0.1 --directory build/web
```

ブラウザで http://127.0.0.1:8765/ を開いてください。Web版はWebGL 2.0対応ブラウザが必要です。

## あそび方

1. 楽曲と難易度、クイズのジャンルを選ぶ。
2. 10問に回答する。各問に正解・解説を表示。
3. 3・2・1・STARTの後、丸の中のタイミングリングが外周と重なる瞬間にタップ。
4. 同じ色の隣の丸を順番に押してつなぎ、3個以上で「消す」を押す。判定・加点は各ピースを押した瞬間。
5. 曲が終わるとリザルト。再プレイはクイズから。

タップ／左クリックで同色の丸をつなぎます。指を離しても接続は保持されます。押したまま次の丸へ移動する操作にも対応。
直前の丸へ戻ると1個取り消し。「つなぎ直す」で選択を解除できます。リング1回につき判定は1回です。リングがない丸では加点されません。
右上のⅡで一時停止。フォーカス喪失やアプリのバックグラウンド移行でも停止し、再開には操作が必要です。

## 収録内容

- オリジナル学習問題70問、7ジャンル＋全ジャンル混合。公式過去問ではありません。
- オリジナルデモ音源3曲（約41〜58秒）。各曲BEGINNER / NORMAL / HARD。
- BEGINNERは4拍、NORMALは2拍、HARDは1拍ごとにリングが出現。同時表示は1個。
- 3／4／5色の難易度。色のほかに記号で区別。
- 手詰まりの自動解消、つなげられる丸からランダムにタイミングを表示。
- クイズボーナス、タイミング・チェーン・コンボ得点、ランク、ハイスコア。
- 音量、判定オフセット、控えめなアニメーション設定。
- 楽曲×難易度別の保存、クイズ最高／直近成績、バックアップ付き保存。

## 編集

| 編集対象 | ファイル |
|---|---|
| 楽曲、BPM、ジャケット、難易度、ランク基準点 | `resources/music/catalog.json` |
| 問題文、4択、正答、解説、ジャンル | `resources/quiz/questions.json` |
| 判定幅、スコア倍率、クイズ倍率、コンボ演出条件 | `scripts/GameBalance.gd` |
| UIの文字・配置・配色・角丸・フォント | `scenes/*.tscn` のノード、Theme、Theme Overrides |
| 画面の余白 | 各Sceneの `SafeArea`、Rootの `Content Max Width` |

新しいジャンルは有効な問題を10問以上用意してください。`answer` は0始まりです。
楽曲の `beat_offset` は最初の拍の秒数。再生開始位置そのものと拍がずれる音源に使用します。
設定の `offset_ms` は判定の拍を遅らせる方向が＋です。

UIは各 `.tscn` に保存した通常のLabel・Button・Containerです。**エディタの「Text」「Theme Overrides」「Layout」で変更すると、そのまま実行画面に反映されます。** 再生成は不要です。

例えば `scenes/Title.tscn` を開き、シーンツリーの `TitleText` を選んで「Text」を変更して保存し、F6で確認してください。`StartButton` は開始ボタン、`HelpDialog` 内の `HelpStep1`〜`HelpStep3` は操作説明です。
ダイアログは通常非表示なので、編集時にCanvasLayerの「Visible」を有効にすると確認できます。確認後は非表示に戻してください。

スコアなどの可変表示は、Text内の `{score}` のような部分を実行時に置換します。例えば `ScoreLabel` を `得点：{score}` に変更できます。状態によって切り替わる文言はシーンのRootを選び、Inspectorの「Display Text」で編集できます。
問題文・選択肢の実データは `resources/quiz/questions.json`、曲名等は `resources/music/catalog.json` です。詳細は [エディタでの編集方法](docs/EDITOR_GUIDE.md) を参照してください。

## 開発資料

- `docs/IMPLEMENTATION.md`：全STEPの実装対応、Node・Inspector・Signal・確認方法。
- `docs/SOURCE_CODE.md`：設定、全Scene、全GDScript、データの省略なしの全文。
- `docs/VALIDATION.md`：実行した検証と未検証項目。
- `docs/EXPORT.md`：Web／iOSの書き出し方法。

保存先はGodotの `user://progress.cfg`。Webではブラウザのサイトデータに保存されます。
QA版は別名 `qa-test-progress.cfg` を使用し、通常のプレイ記録を変更しません。

## 検証コマンド

`godot` はGodot 4.7.2の実行ファイルに置き換えてください。

```sh
godot --headless --path . --editor --import --quit
godot --headless --path . --scene res://tests/RunTests.tscn
godot --path . --scene res://tests/RunTests.tscn -- --capture
godot --headless --path . --export-release Web build/web/index.html
godot --headless --path . --export-debug "Web QA" build/web/qa/index.html
```

QA版ではブラウザのStartボタンを押すと一連の自動テストを実行します。通常版とは別の配布物です。
テストはデータ検証・判定境界・保存・盤面・入力イベント・画面遷移を確認します。

## 素材

音源とジャケットは本プロジェクト用のオリジナルです。再生成用スクリプトは `tools/generate_assets.py`。
問題データの再生成は `tools/generate_quiz.py`。これらを再実行すると対応する素材・JSONが上書きされます。
Noto Sans JPはSIL Open Font Licenseで同梱しています（`assets/fonts/OFL.txt`）。
エンジン等のライセンスは `THIRD_PARTY_NOTICES.md` を参照してください。
