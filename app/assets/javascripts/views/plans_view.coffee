Mpl2.PlansNewView = Mpl2.ModalView.extend

  setUpUI: ->
    _self = @
    @_super()
    @open()
    $('.fast-start_date').datepicker(
      format: 'mm.dd.yyyy'
    ).on('changeDate', (evt) ->
      $(evt.target).datepicker('hide')
    )
    $('.fast-end_date').datepicker(
      format: 'mm.dd.yyyy'
    ).on('changeDate', (evt) ->
      $(evt.target).datepicker('hide')
    )

  destroyUI: ->
    @close()

Mpl2.PlansEditView = Mpl2.PlansNewView.extend()

Mpl2.PlanItemItemView = Ember.View.extend
  actual_pct: (->
    "width: #{@get('controller.actual_pct')}%"
  ).property('controller.actual_pct')

  planned_pct: (->
    "width: #{@get('controller.planned_pct')}%"
  ).property('controller.planned_pct')

  isOverused: (->
    @get('controller.isOverused')
  ).property('controller.isOverused')