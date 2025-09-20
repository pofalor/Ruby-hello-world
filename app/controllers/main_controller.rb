class MainController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def helloDate
    render html: "¡Hola, mundo! " + Date.today.to_s
  end
end
