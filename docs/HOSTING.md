# スマートフォン向けWeb公開

公開URL: https://itmusic-rhythm-raru.meron1902.chatgpt.site

Sitesで公開成功を確認済み。

Sitesの公開用チェックアウトは `build/mobile-site` です。既存のSiteを更新する場合は、このディレクトリの `.openai/hosting.json` を再利用してください。

- Site ID: `appgprj_6aa41006f4b88191807b8bad5b4f79f6`
- 公開範囲: URLを知っている人（ログイン不要）
- 通常版のみを配置し、QA版や利用者が取り込んだ音源は含めません。
- GodotのWeb書き出し後、配信上限に合わせてWASMを16MiBずつ分割しています。`engine-loader.js` は元のWASMと同一のバイト列に再構成します。
- 次回更新時はGodotの再書き出しに加え、この配信用ディレクトリも更新する必要があります。
- 公開処理の成功と、スマートフォン実機での動作確認は別です。実機検証は未実施です。
