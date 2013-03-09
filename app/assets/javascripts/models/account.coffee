Mpl2.Account = DS.Model.extend Mpl2.TransactionSumsMixin,

  name        : DS.attr('string')
  description : DS.attr('string')
  end_date    : DS.attr('date')
  default     : DS.attr('boolean')

  user                        : DS.belongsTo('Mpl2.User')
  transactions                : DS.hasMany('Mpl2.Transaction')

  hasDetails: (->
    !@get('isNew')
  ).property('isNew')