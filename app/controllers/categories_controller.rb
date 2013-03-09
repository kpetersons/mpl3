class CategoriesController < ApplicationController

  before_filter :authorize

  def index
    render :json => {:categories => current_user.categories.where(:category_id => nil).all}, status: :ok
  end

  def show
    render :json => {:category => current_user.categories.where(:id => params[:id]).first}, status: :ok
  end

  def create
    category = current_user.categories.build(params[:category])
    if category.save
      render :json => {:category => category}, status: :ok
    else
      render :json => {:category => category, :errors => category.errors}, :status => 422
    end
  end

  def update
    category = current_user.categories.where(:id => params[:id]).first
    if category.update_attributes(params[:category])
      render :json => {:category => category}, status: :ok
    else
      render :json => {:category => category, :errors => category.errors}, :status => 422
    end
  end

  def destroy
    Category.transaction do
      category = current_user.categories.where(:id => params[:id]).first
      category.destroy
      render json: nil, status: :ok
    end
  end
end
