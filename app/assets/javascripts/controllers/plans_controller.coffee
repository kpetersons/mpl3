Mpl2.PlansIndexController = Ember.ArrayController.extend(

  plans: (->
    @get('content').filterProperty('id').sort((a, b) ->
      a.get('id') - b.get('id')
    )
  ).property('content.@each.id')
)

Mpl2.PlanItemItemController = Ember.ObjectController.extend(

  actual_value: (->
    @get('transactions_all_sum')
  ).property('content.transactions_all_sum')

  planned_value: ( (key, value)->
    @number_field_property(@get('content'), 'amount', arguments.length, key, value)
  ).property('content.amount')

  isOverused: (->
    planned_value = Number(@get('planned_value'))
    actual_value = Number(@get('actual_value'))
    planned_value < actual_value
  ).property('planned_value', 'actual_value')

  actual_pct: (->
    max = @max_value()
    val = @get('actual_value')
    val = val/max*100
    if @get('isOverused')
      return val - @get('planned_pct')
    val
  ).property('max_percent')

  planned_pct: (->
    max = @max_value()
    val = @get('planned_value')
    val = val/max*100
    unless @get('isOverused')
      return val - @get('actual_pct')
    val
  ).property('max_percent')

  max_percent: (->
    if @get('content.plan.plan_items.isLoaded')
      max = @max_value()
      max_percent = Number(@get('planned_value'))
      actual =  Number(@get('actual_value'))
      if max_percent < actual
        max_percent = actual
      max_percent = max_percent/max*100
  ).property('content.plan.plan_items.@each.amount', 'content.plan.plan_items.@each.transactions_all_sum')

  max_value: ->
    _self = @
    plan_items = @get('content.plan.plan_items')
    if plan_items
      max =  0
      plan_items.forEach (item, index, list) ->
        max = _self.get('content.plan.max') || 0
        val = Number(item.get('transactions_all_sum'))
        if val > max
          _self.set('content.plan.max', val)
        val = Number(item.get('amount'))
        if val > max
          _self.set('content.plan.max', val)
      return @get('content.plan.max')
    0
)

Mpl2.PlansNewController = Mpl2.ObjectFormController.extend(

  start_date_value: ( (key, value)->
    @date_field_property(@get('content'), 'start_date', arguments.length, key, value)
  ).property('content.start_date')

  end_date_value: ( (key, value)->
    @date_field_property(@get('content'), 'end_date', arguments.length, key, value)
  ).property('content.end_date')

)

Mpl2.PlanEditController = Mpl2.PlansNewController.extend(
)

Mpl2.PlanDetailsController = Ember.ObjectController.extend(

  doSave: (model) ->
    pi = model.get('plan_items')
    if pi
      pi = pi.filterProperty('isDirty', true)
      pi.forEach (item) ->
        item.get('transaction').commit()


  doClose: (model)->
    @get('target').send('doClose', model)

  modelObserver: (->
    pi = @get('content.plan_items')
    if pi
      pi = pi.filterProperty('isSaved', true)
      pi.forEach (item) ->
        item.get('transaction').commit()
        item.resetState()
  ).observes('content.plan_items.@each.isSaved')

)