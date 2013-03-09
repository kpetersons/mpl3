Mpl2.PlanItem = DS.Model.extend Mpl2.TransactionSumsMixin,

  amount    : DS.attr('number')

  user                        : DS.belongsTo('Mpl2.User')
  plan                        : DS.belongsTo('Mpl2.Plan')
  category                    : DS.belongsTo('Mpl2.Category')
  transactions                : DS.hasMany('Mpl2.Transaction')