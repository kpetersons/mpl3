Mpl2.Category = DS.Model.extend  Mpl2.TransactionSumsMixin,

  name            : DS.attr('string')
  description     : DS.attr('string')
  type            : DS.attr('string')
  end_date        : DS.attr('date')

  user                : DS.belongsTo('Mpl2.User')
  transactions        : DS.hasMany('Mpl2.Transaction')

  parent            : DS.belongsTo('Mpl2.Category')
  children          : DS.hasMany('Mpl2.Category')

  category            : DS.belongsTo('Mpl2.Category')
  categories          : DS.hasMany('Mpl2.Category')

  hasDetails: (->
    !@get('isNew')
  ).property('isNew')