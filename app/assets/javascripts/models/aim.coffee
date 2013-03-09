Mpl2.Aim = DS.Model.extend  Mpl2.TransactionSumsMixin,

  amount        :DS.attr('number')
  name          :DS.attr('string')
  target_date   :DS.attr('date')
  from_date     :DS.attr('date')
  complete      :DS.attr('boolean')
  complete_date :DS.attr('date')

  user                        : DS.belongsTo('Mpl2.User')
  category                    : DS.belongsTo('Mpl2.Category')
  transactions                : DS.hasMany('Mpl2.Transaction')

  hasDetails: (->
    !@get('isNew')
  ).property('isNew')

  actual_amount: (->
    @sumArray(@get('transactions').getEach('amount'))
  ).property('transactions.@each.amount')

  is_overused: (->
    @get('actual_amount') > @get('amount')
  ).property('amount', 'actual_amount')

  pct_actual_less_sum: (->
    "width: #{@get('actual_less_sum')}%"
  ).property('actual_less_sum')

  pct_actual_more_sum: (->
    "width: #{@get('actual_more_sum')}%"
  ).property('actual_more_sum')

  pct_target_sum: (->
    "width: #{@get('target_sum')}%"
  ).property('target_sum')

  actual_less_sum: (->
    @get('actual_amount') / @get('amount') * 100
  ).property('amount', 'actual_amount')

  actual_more_sum: (->
    100 - @get('target_sum')
  ).property('amount', 'actual_amount')

  target_sum: (->
    @get('amount') / @get('actual_amount') * 100
  ).property('amount', 'actual_amount')

  amount_sum: (->
    @formatAmount(@get('amount'))
  ).property('amount')