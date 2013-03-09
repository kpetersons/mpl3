class AimsController < ApplicationController

  before_filter :authorize

  def index
    render :json => {:aims => current_user.aims.order("created_at")}
  end

  def show
    aim = current_user.aims.where(:id => params[:id]).first
    unless aim
      aim = Aim.new
    end
    render :json => {:aim => aim}
  end

  def create
    Aim.transaction do
      aim = current_user.aims.build(params[:aim])
      if aim.save
        render :json => {:aim => aim}
      else
        render :json => {:aim => aim, :errors => aim.errors}, :status => 422
      end
    end
  end

  def update
    Aim.transaction do
      aim = current_user.aims.where(:id => params[:id]).first
      if aim.update_attributes(params[:aim])
        render :json => {:aim => aim}
      else
        render :json => {:aim => aim, :errors => aim.errors}, :status => 422
      end
    end
  end

  def destroy
    Aim.transaction do
      aim = current_user.aims.where(:id => params[:id]).first
      if aim
        aim.destroy()
        render :json => ''
      end
    end
  end

end
