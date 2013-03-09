Mpl2.AimsIndexRoute = Ember.Route.extend

  model: ->
    Mpl2.Aim.find()

  renderTemplate: ->
    @render('aims.index', into: 'application')

Mpl2.AimsNewRoute = Ember.Route.extend

  model: ->
    Mpl2.Aim.createRecord()

  renderTemplate: ->
    @render('aims.index', into: 'application')
    @render(into: 'application', outlet: 'modal')

  setupController: (controller, model) ->
    aims = @controllerFor('aims')
    aims.set('content', Mpl2.Aim.find())
    controller.set('categories', Mpl2.Category.find())

  events:
    doCancel: ->
      @transitionTo('aims')

    doSave: ->
      @transitionTo('aims')

Mpl2.AimEditRoute = Ember.Route.extend

  model: (params)->
    @modelFor('aim')

  renderTemplate: ->
    @render('aims.index', into: 'application')
    @render(into: 'application', outlet: 'modal')

  setupController: (controller, model) ->
    aims = @controllerFor('aims.index')
    aims.set('content', Mpl2.Aim.find())

  events:
    doDetails: (aim)->
      @transitionTo('aims.details', aim)

    doCancel: ->
      @transitionTo('aims')

    doSave: ->
      @transitionTo('aims')

Mpl2.AimDetailsRoute = Ember.Route.extend

  model: (params)->
    aim = @modelFor('aim')
    aim.reload()
    aim

  renderTemplate: ->
    @render('aim.details', into: 'application')

  events:
    doClose: ->
      @transitionTo('aims')

Mpl2.AimTransactionEditRoute = Ember.Route.extend

  setupController: (controller, model) ->
    controller.set('content', @modelFor('aim.transaction'))
    controller.set('accounts', Mpl2.Account.find())
    controller.set('categories', Mpl2.Category.find())

    aimDetails = @controllerFor('aim.details')
    aimDetails.set('content', @modelFor('aim'))

  renderTemplate: ->
    @render('aim.details', into: 'application')
    @render(into: 'application', outlet: 'modal')

  events:
    doCancel: (transaction)->
      @transitionTo('aim.details', @modelFor('aim'))

    doSave: (transaction)->
      @transitionTo('aim.details', @modelFor('aim'))

Mpl2.AimTransactionsNewRoute = Ember.Route.extend

  model: ->
    Mpl2.Transaction.createRecord(category: @modelFor('aim').get('category'))

  setupController: (controller, model) ->
    controller.set('accounts', Mpl2.Account.find())
    controller.set('categories', Mpl2.Category.find())

    aimDetails = @controllerFor('aim.details')
    aimDetails.set('content', @modelFor('aim'))

  renderTemplate: ->
    @render('aim.details', into: 'application')
    @render(into: 'application', outlet: 'modal')

  events:
    doCancel: (transaction)->
      @transitionTo('aim.details', @modelFor('aim'))

    doSave: (transaction)->
      @transitionTo('aim.details', @modelFor('aim'))