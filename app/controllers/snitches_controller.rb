class SnitchesController < ApplicationController
  def create
  #  @snitch = Snitch.find_or_create_by(params[:id])
    render :json => {}, :status => :ok
  end

  def update
    #FIXME: Fix inital post
    begin
      
    rescue
      render :json => {}, :status => :ok
    end
  end
end
