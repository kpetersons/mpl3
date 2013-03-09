Mpl2.CategoriesIndexRoute = Ember.Route.extend

  model: ->
    Mpl2.Category.find()

  renderTemplate: ->
    @render('categories.index', into: 'application')

Mpl2.CategoriesGroupRoute = Ember.Route.extend

  model: ->
    Mpl2.Category.createRecord(type: 'group')

  renderTemplate: ->
    @render('categories.index', into: 'application')
    @render(into: 'application', outlet: 'modal')

  events:
    doCancel: (model)->
      model.get('transaction').rollback()
      @transitionTo('categories.index')

    doSave: (model)->
      categories = @controllerFor('categories.index')
      selectedCategories = categories.get('content').filterProperty('isSelected', true)
      model.set('categories', selectedCategories)
      selectedCategories.setEach('category', model)
      model.one 'didCreate', @, ->
        @transitionTo('categories.index')
      model.get('transaction').commit()

Mpl2.CategoriesNewRoute = Ember.Route.extend

  renderTemplate: ->
    @render('categories.index', into: 'application')
    @render(into: 'application', outlet: 'modal')

  setupController: (controller, model) ->
    categories = @controllerFor('categories')
    categories.set('content', Mpl2.Category.find())

  events:
    doCancel: ->
      @transitionTo('categories.index')

    doSave: ->
      @transitionTo('categories.index')

Mpl2.CategoriesNewIncomeRoute = Mpl2.CategoriesNewRoute.extend

  model: (params)->
    Mpl2.Category.createRecord(type: 'income')

Mpl2.CategoriesNewExpenseRoute = Mpl2.CategoriesNewRoute.extend

  model: (params)->
    Mpl2.Category.createRecord(type: 'expense')


Mpl2.CategoryEditRoute = Ember.Route.extend

  model: (params)->
    @modelFor('category')

  renderTemplate: ->
    @render('categories.index', into: 'application')
    @render(into: 'application', outlet: 'modal')

  setupController: (controller, model) ->
    categories = @controllerFor('categories')
    categories.set('content', Mpl2.Category.find())

  events:
    doCancel: ->
      @transitionTo('categories.index')

    doSave: ->
      @transitionTo('categories.index')

    doDetails: (category)->
      @transitionTo('category.details', category)

Mpl2.CategoryDeleteRoute = Ember.Route.extend

  model: (params)->
    @modelFor('category')

  renderTemplate: ->
    @render('categories.index', into: 'application')
    @render(into: 'application', outlet: 'modal')

  setupController: (controller, model) ->
    categories = @controllerFor('categories.index')
    categories.set('content', Mpl2.Category.find())

  events:
    doCancel: ->
      @transitionTo('categories.index')

    doSave: (model)->
      model.one 'didDelete', @, ->
        @transitionTo('categories.index')
      model.deleteRecord()
      model.get('transaction').commit()

Mpl2.CategoryRoute = Ember.Route.extend

  renderTemplate: ->
    @render(into: 'application')

Mpl2.CategoryDetailsRoute = Ember.Route.extend

  model: (params)->
    category = @modelFor('category')
    category.reload()
    category

  renderTemplate: ->
    @render(into: 'application')

  events:
    doClose: ->
      @transitionTo('categories')

Mpl2.CategoryTransactionEditRoute = Ember.Route.extend

  setupController: (controller, model) ->
    controller.set('content', @modelFor('category.transaction'))
    controller.set('accounts', Mpl2.Account.find())
    controller.set('categories', Mpl2.Category.find())

    catDetails = @controllerFor('category.details')
    catDetails.set('content', @modelFor('category'))

  renderTemplate: ->
    @render('category/details', into: 'application')
    @render(into: 'application', outlet: 'modal')

  events:
    doCancel: (transaction)->
      @transitionTo('category.details', @modelFor('category'))

    doSave: (transaction)->
      @transitionTo('category.details', @modelFor('category'))

Mpl2.CategoryTransactionsNewRoute = Ember.Route.extend

  model: ->
    category = @modelFor('category')
    category.get('transaction').removeCleanRecords()
    Mpl2.Transaction.createRecord(category: category, type: category.get('type'))

  setupController: (controller, model) ->
    controller.set('accounts', Mpl2.Account.find())
    controller.set('categories', Mpl2.Category.find())

    catDetails = @controllerFor('category.details')
    catDetails.set('content', @modelFor('category'))

  renderTemplate: ->
    @render('category/details', into: 'application')
    @render(into: 'application', outlet: 'modal')

  events:
    doCancel: (transaction)->
      @transitionTo('category.details', @modelFor('category'))

    doSave: (transaction)->
      @transitionTo('category.details', @modelFor('category'))