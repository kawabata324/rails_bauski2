# アセットのコンパイル

３つの動作Mode

* development
* test
* production

bin/rails s コマンドで立ち上げた際はdefaultのdevelopmentモードで動く

また動作モードとは正確には環境と呼ばれている

production mode

本番で使用するための動作モードです。このモードではソースコードが書き変わってもアプリケーションは
リロードされず、起動時の状態で動作します。

また、Railsアプリケーション自体が画像ファイル、Javascript. CSSファイルをブラウザに
返さなくなります。
実運用環境ではこれらはApacheやNginxなどのwebサーバーがこれらのファイルを取り扱うから

# 暗号化された資格情報

Password,秘密鍵, APIへのアクセストークンなどの資格情報をどのようにサーバーに保持するのかは重要
これらの情報はサーバー管理者以外の目から隠す必要がある
Railsには「暗号化された資格情報(Encrypted Credentials)」という仕組みが最初から組み込まれている

資格情報はconfig以下のこれらのファイルを用いて保持される

* credentials.yml.enc
* master.key

前者には資格情報が暗号化されて記録される
後者は暗号を解くための鍵です。
githubなどのリポジトリで管理する場合はmaster.keyは管理対象から外します。
