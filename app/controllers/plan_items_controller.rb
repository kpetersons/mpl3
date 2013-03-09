class PlanItemsController < ApplicationController
  before_filter :authorize

  def index
    if params[:ids]
      render :json => {:plan_items => current_user.plan_items.where(:id => params[:ids]).order(:id).all} and return
    end
    render :json => {:plan_items => current_user.plan_items.order(:id)}
  end

  def show
    render :json => {:plan_items => current_user.plan_items.where(:id => params[:id]).first}
  end

  def update
    plan_item = current_user.plan_items.where(:id => params[:id]).first
    logger.fatal "params[:plan_item][:amount] #{params[:plan_item][:amount]}"
    if plan_item.update_attribute(:amount, params[:plan_item][:amount])
      render :json => {:plan_item => plan_item}
    else
      render :json => {:plan_item => plan_item}, :status => 422
    end
  end
end
