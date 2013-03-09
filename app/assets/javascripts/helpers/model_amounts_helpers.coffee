DS.Model.reopen
  formatAmount: (value)->
    value = value || 0
    accounting.formatMoney(value, '')

Mpl2.Transaction.reopen

  amount_fmt: (->
    @formatAmount(@get('amount'))
  ).property('amount')