Mpl2.CategoriesIndexController = Ember.ArrayController.extend

  isAnySelected: false

  categories: (->
    @get('content').filterProperty('id').sort((a, b) ->
      a.get('id') - b.get('id')
    )
  ).property('content.@each.id')

  isAnySelected: (->
    @get('content').findProperty('isSelected')
  ).property('content.@each.isSelected')

Mpl2.CategoryIndexItemController = Ember.Controller.extend

  isGroup:( ->
    @get('content.type') == 'group'
  ).property('content.type')

  doSelect: ->
    @toggleProperty('content.isSelected')

Mpl2.CategoriesNewController = Mpl2.ObjectFormController.extend()
Mpl2.CategoriesNewIncomeController = Mpl2.CategoriesNewController.extend()
Mpl2.CategoriesNewExpenseController = Mpl2.CategoriesNewController.extend()

#Mpl2.CategoriesGroupController = Mpl2.CategoriesNewController.extend()
Mpl2.CategoriesGroupController = Ember.ObjectController.extend()

Mpl2.CategoryEditController = Mpl2.CategoriesNewController.extend
  end_date_value: ( (key, value)->
    @date_field_property(@get('content'), 'end_date', arguments.length, key, value)
  ).property('content.end_date')

Mpl2.CategoriesMergeController = Mpl2.CategoriesNewController.extend()

Mpl2.CategoryDetailsController = Ember.ObjectController.extend
  doClose: (model)->
    @get('target').send('doClose', model)