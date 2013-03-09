Mpl2.PlansIndexRoute = Ember.Route.extend

  model: ->
    Mpl2.Plan.find()

  renderTemplate: ->
    @render(into: 'application')

Mpl2.PlansNewRoute = Ember.Route.extend

  model: ->
    Mpl2.Plan.createRecord()

  renderTemplate: ->
    @render('plans.index', into: 'application')
    @render(into: 'application', outlet: 'modal')

  setupController: (controller, model) ->
    plans = @controllerFor('plans.index')
    plans.set('content', Mpl2.Plan.find())

  events:
    doCancel: ->
      @transitionTo('plans')

    doSave: ->
      @transitionTo('plans')


Mpl2.PlanEditRoute = Mpl2.PlansNewRoute.extend
  model: (params)->
    @modelFor('plan')

  renderTemplate: ->
    @render('plans.index', into: 'application')
    @render(into: 'application', outlet: 'modal')

  setupController: (controller, model) ->
    plans = @controllerFor('plans.index')
    plans.set('content', Mpl2.Plan.find())

  events:
    doDetails: (plan)->
      @transitionTo('plan.details', plan)

    doCancel: ->
      @transitionTo('plans')

    doSave: ->
      @transitionTo('plans')


Mpl2.PlanDetailsRoute = Ember.Route.extend

  model: (params)->
    plan = @modelFor('plan')
    plan.reload()
    plan

  renderTemplate: ->
    @render('plan.details', into: 'application')

  events:
    doClose: ->
      @transitionTo('plans')