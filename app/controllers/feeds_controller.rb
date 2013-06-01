class FeedsController < ApplicationController
  def index
    @data = Request.get_request("#{Constant::POPULAR}?client_id=#{APP_CONFIG['iclient_id']}")
    render :partial => 'content' and return if request.xhr?
  end
end
