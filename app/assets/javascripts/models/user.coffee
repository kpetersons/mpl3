Mpl2.User = DS.Model.extend
  email : DS.attr('string')

  accounts          : DS.hasMany('Mpl2.Account',         key: 'account_ids')
  transactions      : DS.hasMany('Mpl2.Transaction',     key: 'transaction_ids')
  categories        : DS.hasMany('Mpl2.Category',        key: 'category_ids')