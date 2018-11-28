class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelist
  include SetSource
  include CurrentUserConcern
  include DefaultPageContent

  before_action :set_copyright, :server_name

  def set_copyright
    @copyright = PkFootTool::Renderer.copyright("Pankaj Kumar Singh", "All Rights Reserved")
  end

  def server_name
  	response.headers['Server'] = 'Puma 3.11.4'
  end
end