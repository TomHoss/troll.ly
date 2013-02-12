class SnitchesController < ApplicationController
  def create
  #  @snitch = Snitch.find_or_create_by(params[:id])
    render :json => {}, :status => :ok
  end

  def update
    render :json => {}, :status => :ok
  end
end
