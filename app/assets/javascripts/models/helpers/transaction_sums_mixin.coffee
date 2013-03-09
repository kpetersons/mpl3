Mpl2.TransactionSumsMixin = Ember.Mixin.create

  transactions_all_sum: (->
    @formatAmount(@sumArray(
      @incomes().getEach('amount')
      )
    )
  ).property('transactions.@each.amount')

  transactions_week_sum: (->
    @formatAmount(@sumArray(
      @filterRange(
        @incomes(), @rangeWeek()
        ).getEach('amount')
      ))
    ).property('transactions.@each.amount')

  transactions_month_sum: (->
    @formatAmount(@sumArray(
      @filterRange(
        @incomes(), @rangeMonth()
      ).getEach('amount')
    ))
  ).property('transactions.@each.amount')

  filterRange: (transactions, range)->
    result = transactions.filter (item) ->
      if item.get('isLoaded')
        mom = moment(item.get('date_when'))
        range.contains(mom)
    result

  rangeMonth: ->
    start = moment().startOf('month').sod()
    end   = moment().endOf('month').eod()
    result = moment().range(start, end);
    result

  rangeWeek: ->
    start = moment().day(1).sod()
    end   = moment().day(7).eod()
    moment().range(start, end);

  sumArray: (arr) ->
    if arr.length == 0
      arr = [0]
    result = arr.reduce (t, s) -> t + s
    result

  incomes: ->
    result = @get('transactions')
    result