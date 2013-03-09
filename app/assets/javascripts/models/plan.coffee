Mpl2.Plan = DS.Model.extend  Mpl2.TransactionSumsMixin,

  name        : DS.attr('string')
  description : DS.attr('string')
  start_date    : DS.attr('date')
  end_date    : DS.attr('date')

  user                        : DS.belongsTo('Mpl2.User')
  plan_items                  : DS.hasMany('Mpl2.PlanItem')
  transactions                : DS.hasMany('Mpl2.Transaction')

  hasDetails: (->
    !@get('isNew')
  ).property('isNew')


  actual_sum: (->
    @formatAmount @sumArray(
      @get('transactions').getEach('amount')
    )
  ).property('transactions.@each.amount')

  planned_sum: (->
    pi = @get('plan_items')
    return @formatAmount(0) unless pi
    @formatAmount @sumArray(
      pi.getEach('amount')
    )
  ).property('plan_items.@each.amount')

  max_actual: (->
    plan_items = @get('plan_items')
    max = 0
    plan_items.forEach (item, idx, en) ->
      sum = item.get('transactions_all_sum')
      if sum > max
        max = sum
    console.log max
    max
  ).property('plan_items.@each.transactions.@each.amount')