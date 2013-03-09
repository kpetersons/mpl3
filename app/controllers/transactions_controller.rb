class TransactionsController < ApplicationController
  before_filter :authorize

  def index
    if params[:ids]
      render :json => {:transactions => current_user.transactions.where(:id => params[:ids]).all} and return
    end
    if params[:account_id]
      account = current_user.accounts.where(:id => params[:account_id]).first
      render :json => {:transactions => current_user.transactions.where(:account_id => account.id).all} and return
    end
    render :json => {:transactions => current_user.transactions}
  end

  def show
    unless params[:id]
      render :json => {:transaction => {}} and return
    end
    transaction = current_user.transactions.where(:id => params[:id]).first
    render :json => {:transaction => transaction}
  end


  def create
    Transaction.transaction do
      transaction = current_user.transactions.build(params[:transaction])
      if transaction.save
        render :json => {:transaction => transaction}
      else
        render :json => {:transaction => transaction, :errors => transaction.errors}, :status => 422
      end
    end
  end

  def update
    Transaction.transaction do
      transaction = current_user.transactions.where(:id => params[:id]).first
      if transaction.update_attributes(params[:transaction])
        render :json => {:transaction => transaction}
      else
        render :json => {:transaction => transaction, :errors => transaction.errors}, :status => 422
      end
    end
  end

  def destroy
    transaction = current_user.transactions.where(:id => params[:id]).first
    if transaction
      transaction.destroy()
      render :json => ''
    end
  end

end
