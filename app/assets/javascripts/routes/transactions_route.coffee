Mpl2.TransactionsIndexRoute = Ember.Route.extend

  model: ->
    Mpl2.Transaction.find()

  renderTemplate: ->
    @render(into: 'application')

Mpl2.TransactionsNewRoute = Ember.Route.extend

  model: ->
    Mpl2.Transaction.createRecord()

  setupController: (controller, model)->
    controller.set('categories', Mpl2.Category.find())
    controller.set('accounts', Mpl2.Account.find())

    controller = @controllerFor('transactions')
    controller.set('content', Mpl2.Transaction.find())

  renderTemplate: ->
    @render('transactions', into: 'application')
    @render(outlet: 'modal', into: 'application')

  events:
    doCancel: ->
      @transitionTo('transactions')

    doSave: ->
      @transitionTo('transactions')

Mpl2.TransactionEditRoute = Mpl2.TransactionsNewRoute.extend(
  model: (params)->
    @modelFor('transaction')
)

Mpl2.TransactionsDeleteRoute = Mpl2.TransactionEditRoute.extend()