# 書き出し

## Web

Godot 4.7.2のWebテンプレート（single-threaded）が必要です。この環境には配置済みです。
別環境では「エディター → エクスポートテンプレートの管理 → ダウンロードしてインストール」で同じバージョンを用意してください。

1. 「プロジェクト → エクスポート」をクリック。
2. `Web` を選択。
3. `Variant → Thread Support = Off`、`Extensions Support = Off` を確認。
4. 「プロジェクトのエクスポート」から `build/web/index.html` に保存。
5. HTTPまたはHTTPSで配信して確認。公開環境ではHTTPSを使用。

`build/ITmusic-Web.zip` は通常版のみです。展開したファイルの名前や相対配置を保って配信してください。
`build/web/qa` は検証専用であり、通常版の配布ZIPには含めません。

JSONはinclude_filterに明示してあり、エディターでは動くが書き出し後にデータが消える問題を防いでいます。
音声はAudioStreamPlayerのStream再生で扱い、再生位置にミックス時刻を加え出力遅延を引いて判定します。
Webの遅延は環境によって異なるため、タイトルの設定画面で判定オフセットを調整できます。
最初の操作から音声システムを有効にし、カウントダウン終了後に曲を再生します。

## iOS

`iOS` プリセットと公式4.7.2テンプレートは準備済みです。
**署名情報が未提供のため、Xcodeプロジェクトの書き出し・署名済みIPA・実機動作は未確認です。**

1. 「プロジェクト → エクスポート → iOS」を選択。
2. `Application → App Store Team ID` にApple Developerの10文字のTeam IDを入力。
3. `Application → Bundle Identifier` の `com.example.itmusic` を所有する一意のIDへ変更。
4. `Application → Export Project Only = On` でXcodeプロジェクトを書き出し。
5. 生成された `.xcodeproj` をXcodeで開く。
6. 「Signing & Capabilities」でTeamを選択し、署名を設定。
7. iPhone 16eを選んで実行。初回は端末側の開発者モード等を設定。

プリセットのBundle IDは仮値です。アカウント・証明書・プロビジョニングプロファイルは同梱していません。
現環境ではXcode 26.6とiPhone 16eシミュレーターの存在を確認しています。

## 実機で残る確認

- ノッチとホームインジケーターに重要なUIが重ならないこと。
- 画面回転時に縦画面が維持されること。
- 通話・ホーム移動・ロックから戻ると一時停止メニューになること。
- 連続プレイ時の60FPS、温度、バッテリー、タッチ遅延。
- 内蔵スピーカー／有線／Bluetoothでの音声遅延と判定調整。
- Safari実機での音声再生、サイトデータの保存と再読み込み。

FPSの上限は60に設定していますが、実機の60FPSを測定済みという意味ではありません。

## 公式資料

- https://docs.godotengine.org/en/4.7/tutorials/export/exporting_for_web.html
- https://docs.godotengine.org/en/4.7/tutorials/export/exporting_for_ios.html
- https://docs.godotengine.org/en/4.7/classes/class_audiostreamplayer.html
