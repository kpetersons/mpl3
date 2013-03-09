Mpl2.AccountsIndexRoute = Ember.Route.extend

  model: ->
    Mpl2.Account.find()

  renderTemplate: ->
    @render('accounts.index', into: 'application')

Mpl2.AccountsNewRoute = Ember.Route.extend

  model: ->
    Mpl2.Account.createRecord()

  renderTemplate: ->
    @render('accounts.index', into: 'application')
    @render(into: 'application', outlet: 'modal')

  setupController: (controller, model) ->
    accounts = @controllerFor('accounts.index')
    accounts.set('content', Mpl2.Account.find())

  events:
    doCancel: ->
      @transitionTo('accounts')

    doSave: ->
      @transitionTo('accounts')

Mpl2.AccountEditRoute = Mpl2.AccountsNewRoute.extend

  model: (params)->
    @modelFor('account')

  renderTemplate: ->
    @render('accounts.index', into: 'application')
    @render(into: 'application', outlet: 'modal')

  setupController: (controller, model) ->
    accounts = @controllerFor('accounts.index')
    accounts.set('content', Mpl2.Account.find())

  events:
    doDetails: (account)->
      @transitionTo('account.details', account)

    doCancel: ->
      @transitionTo('accounts')

    doSave: ->
      @transitionTo('accounts')

Mpl2.AccountDetailsRoute = Ember.Route.extend

  model: (params)->
    account = @modelFor('account')
    account.reload()
    account

  renderTemplate: ->
    @render('account.details', into: 'application')

  events:
    doClose: ->
      @transitionTo('accounts')

Mpl2.AccountTransactionEditRoute = Ember.Route.extend

  setupController: (controller, model) ->
    controller.set('content', @modelFor('account.transaction'))
    controller.set('accounts', Mpl2.Account.find())
    controller.set('categories', Mpl2.Category.find())

    actDetails = @controllerFor('account.details')
    actDetails.set('content', @modelFor('account'))

  renderTemplate: ->
    @render('account.details', into: 'application')
    @render(into: 'application', outlet: 'modal')

  events:
    doCancel: (transaction)->
      @transitionTo('account.details', @modelFor('account'))

    doSave: (transaction)->
      @transitionTo('account.details', @modelFor('account'))

Mpl2.AccountTransactionsNewRoute = Ember.Route.extend

  model: ->
    Mpl2.Transaction.createRecord(account: @modelFor('account'))

  setupController: (controller, model) ->
    controller.set('accounts', Mpl2.Account.find())
    controller.set('categories', Mpl2.Category.find())

    actDetails = @controllerFor('account.details')
    actDetails.set('content', @modelFor('account'))

  renderTemplate: ->
    @render('account.details', into: 'application')
    @render(into: 'application', outlet: 'modal')

  events:
    doCancel: (transaction)->
      @transitionTo('account.details', @modelFor('account'))

    doSave: (transaction)->
      @transitionTo('account.details', @modelFor('account'))