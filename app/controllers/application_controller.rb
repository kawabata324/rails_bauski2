class ApplicationController < ActionController::Base
  layout :set_layout

  private def set_layout
    if params[:controller].match(%r{\A(staff|admin|customer)/})
      Regexp.last_match[1]
    else
      "customer"
    end
  end
end

# ApplicationControllerとは何か

# クライアントから届いたHTTPリクエストを処理するのは特定のコントローラの特定のアクションです
# どのアクションが担当するのかを決定するのがconfig/routes.rbです。

# しかし、Application ControllerはHTTPリクエストを受けて動くものではない。
# 全てのコントローラの親(あるいは祖先)のクラスであり、自らが所有するメソッドを子や孫に引き渡すことによってその役割を終わります。
