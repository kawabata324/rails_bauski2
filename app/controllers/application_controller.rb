class ApplicationController < ActionController::Base
  layout :set_layout

  class Forbidden < ActionController::ActionControllerError; end

  class IpAddressRejected < ActionController::ActionControllerError; end

  rescue_from StandardError, with: :rescue500
  rescue_from Forbidden, with: :rescue403
  rescue_from IpAddressRejected, with: :rescue403
  rescue_from ActiveRecord::RecordNotFound, with: :rescue404

  private

    def set_layout
      if params[:controller].match(%r{\A(staff|admin|customer)/})
        Regexp.last_match[1]
      else
        "customer"
      end
    end

    def rescue403(e)
      @exception = e
      render "errors/forbidden", status: 403
    end

    def rescue404(e)
      render "errors/not_found", status: 404
    end

    def rescue500(e)
      render "errors/internal_server_error", status: 500
    end
end

# ApplicationControllerとは何か

# クライアントから届いたHTTPリクエストを処理するのは特定のコントローラの特定のアクションです
# どのアクションが担当するのかを決定するのがconfig/routes.rbです。

# しかし、Application ControllerはHTTPリクエストを受けて動くものではない。
# 全てのコントローラの親(あるいは祖先)のクラスであり、自らが所有するメソッドを子や孫に引き渡すことによってその役割を終わります。
