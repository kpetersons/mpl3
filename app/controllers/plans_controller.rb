class PlansController < ApplicationController

  before_filter :authorize
  before_filter :prepare_plan_items, :only => [:index]

  def index
    render :json => {:plans => current_user.plans.order("created_at")}
  end

  def show
    plan = current_user.plans.where(:id => params[:id]).first
    unless plan
      plan = Plan.new
    end
    render :json => {:plan => plan}
  end

  def create
    Plan.transaction do
      plan = current_user.plans.build(params[:plan])
      if plan.save
        render :json => {:plan => plan}
      else
        render :json => {:plan => plan, :errors => plan.errors}, :status => 422
      end
    end
  end

  def update
    Plan.transaction do
      plan = current_user.plans.where(:id => params[:id]).first
      if plan.update_attributes(params[:plan])
        render :json => {:plan => plan}
      else
        render :json => {:plan => plan, :errors => plan.errors}, :status => 422
      end
    end
  end

  def destroy
    Plan.transaction do
      plan = current_user.plans.where(:id => params[:id]).first
      if plan
        plan.destroy()
        render :json => ''
      end
    end
  end

  private
  def prepare_plan_items
    return unless current_user
    pi_proc = Proc.new{|categories|
      logger.fatal "Info logger 0"
      categories.each do |category|
        logger.fatal "Info logger 1"
        plans = current_user.plans
        plans.each do |plan|
          logger.fatal "Info logger 2"
          pi = plan.plan_items.where(:category_id => category.id).first
          logger.fatal "Info logger 3"
          unless pi
            logger.fatal "Info logger 4"
            pi = PlanItem.create({:user_id => current_user.id, :plan_id => plan.id, :category_id => category.id})
            pi.save
            logger.fatal "Info logger #{pi.errors}"
          end
        end
      end
    }
    pi_proc.call(current_user.categories)
  end

end
