Mpl2.AimsIndexController = Ember.ArrayController.extend

  isAnySelected: false

  aims: (->
    @get('content').filterProperty('id').sort((a, b) ->
      a.get('id') - b.get('id')
    )
  ).property('content.@each.id')

  isAnySelected: (->
    @get('content').findProperty('isSelected')
  ).property('content.@each.isSelected')

Mpl2.AimsItemController = Ember.Controller.extend

  doSelect: ->
    @toggleProperty('content.isSelected')

Mpl2.AimsNewController = Mpl2.ObjectFormController.extend(

  amount_value: ( (key, value)->
    @number_field_property(@get('content'), 'amount', arguments.length, key, value)
  ).property('content.amount')

  category_value: ( (key, value)->
    result = @classifier_field_property(@get('content'), 'category', 'categories', 'name', arguments.length, key, value)
  ).property('content.category', 'content.categories.@each.isLoaded')

  date_from_value: ( (key, value)->
    @date_field_property(@get('content'), 'from_date', arguments.length, key, value)
  ).property('content.from_date')

  date_target_value: ( (key, value)->
    @date_field_property(@get('content'), 'target_date', arguments.length, key, value)
  ).property('content.target_date')
)

Mpl2.AimEditController = Mpl2.AimsNewController.extend
  end_date_value: ( (key, value)->
    @date_field_property(@get('content'), 'end_date', arguments.length, key, value)
  ).property('content.end_date')

Mpl2.AimDetailsController = Ember.ObjectController.extend
  transactions: (->
    @get('content.transactions')
  ).property('content.transactions.@each.amount')