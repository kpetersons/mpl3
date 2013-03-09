Mpl2.AccountsIndexController = Ember.ArrayController.extend(
  accounts: (->
    @get('content').filterProperty('id').sort((a, b) ->
      a.get('id') - b.get('id')
    )
  ).property('content.@each.id')
)

Mpl2.AccountsNewController = Mpl2.ObjectFormController.extend()
Mpl2.AccountEditController = Mpl2.AccountsNewController.extend(
  end_date_value: ( (key, value)->
    @date_field_property(@get('content'), 'end_date', arguments.length, key, value)
  ).property('content.end_date')
)

Mpl2.AccountDetailsController = Ember.ObjectController.extend(
  transactions: (->
    @get('content.transactions')
  ).property('content.transactions.@each.amount')
)