Mpl2.Transaction = DS.Model.extend
  type        : DS.attr('string')
  amount      : DS.attr('number')
  date_when   : DS.attr('date')
  description : DS.attr('string')

  user                : DS.belongsTo('Mpl2.User')
  account             : DS.belongsTo('Mpl2.Account')
  category            : DS.belongsTo('Mpl2.Category')