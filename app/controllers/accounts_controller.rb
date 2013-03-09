class AccountsController < ApplicationController

  before_filter :authorize

  def index
    render :json => {:accounts => current_user.accounts.order("created_at")}
  end

  def show
    account = current_user.accounts.where(:id => params[:id]).first
    unless account
      account = Account.new
    end
    render :json => {:account => account}
  end

  def create
    Account.transaction do
      account = current_user.accounts.build(params[:account])
      if account.save
        ensure_is_default account, account.default
        render :json => {:account => account}
      else
        render :json => {:account => account, :errors => account.errors}, :status => 422
      end
    end
  end

  def update
    Account.transaction do
      account = current_user.accounts.where(:id => params[:id]).first
      if account.update_attributes(params[:account])
        ensure_is_default account, account.default
        render :json => {:account => account}
      else
        render :json => {:account => account, :errors => account.errors}, :status => 422
      end
    end
  end

  def destroy
    Account.transaction do
      account = current_user.accounts.where(:id => params[:id]).first
      if account
        account.destroy()
        render :json => ''
      end
    end
  end

  def ensure_is_default(account, default)
    if default
      current_user.accounts.all.reject!{|a| a.id == account.id }.each do |account|
        account.update_attribute(:default, !default)
      end
    end
  end

end
