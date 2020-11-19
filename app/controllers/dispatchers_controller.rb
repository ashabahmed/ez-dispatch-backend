class DispatchersController < ApplicationController

  def index
    dispatchers = Dispatcher.all
    render json: dispatchers
  end

end
