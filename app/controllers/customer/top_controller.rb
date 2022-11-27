class Customer::TopController < ApplicationController
  def index
    # Rails用語のActionとは、コントローラクラスのpublicなインスタンスメソッドを指します。
    # customer/top#indexアクションと呼ぶ
    # render とは HTML文書を生成するメソッド
    # 標準パスにあるindexアクション用のERBテンプレートを用いて、HTML文書を作成(省略可能)
    render action: "index"
  end
end
