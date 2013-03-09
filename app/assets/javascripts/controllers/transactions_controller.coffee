Mpl2.TransactionsIndexController = Ember.ArrayController.extend(
  transactions: (->
    @filterProperty('id').sort((a, b) ->
      a.get('id') - b.get('id')
    )
  ).property('content.@each.id')
)

Mpl2.TransactionsNewController = Mpl2.ObjectFormController.extend(

  date_when_value: ( (key, value)->
    @date_field_property(@get('content'), 'date_when', arguments.length, key, value)
  ).property('content.date_when')

  account_value: ( (key, value)->
    @classifier_field_property(@get('content'), 'account', 'accounts', 'name', arguments.length, key, value)
  ).property('content.account', 'content.accounts.@each.isLoaded')

  category_value: ( (key, value)->
    result = @classifier_field_property(@get('content'), 'category', 'categories', 'name', arguments.length, key, value)
    unless arguments.length == 1
      @set('content.type', @get('category.type'))
    result
  ).property('content.category', 'content.categories.@each.isLoaded')

  amount_value: ( (key, value)->
    @number_field_property(@get('content'), 'amount', arguments.length, key, value)
  ).property('content.amount')

#  default_account_observer: (->
#    if not @get('content.account') and @get('content.accounts') and @get('content.accounts').everyProperty('isLoaded', true)
#      @set('content.account', @get('content.accounts').findProperty('default', true))
#  ).observes('content.accounts.@each.isLoaded')

)

Mpl2.TransactionEditController = Mpl2.TransactionsNewController.extend()
Mpl2.TransactionDeleteController = Mpl2.TransactionsNewController.extend()

Mpl2.AccountTransactionEditController = Mpl2.TransactionEditController.extend()
Mpl2.AccountTransactionsNewController = Mpl2.TransactionsNewController.extend()

Mpl2.AimTransactionEditController = Mpl2.TransactionEditController.extend()
Mpl2.AimTransactionsNewController = Mpl2.TransactionsNewController.extend()

Mpl2.CategoryTransactionEditController = Mpl2.TransactionEditController.extend()
Mpl2.CategoryTransactionsNewController = Mpl2.TransactionsNewController.extend()