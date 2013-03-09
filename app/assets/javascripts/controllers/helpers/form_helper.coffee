Mpl2.ObjectFormController = Ember.ObjectController.extend

  canModelDoDetails: (->
    @get('content.hasDetails')
  ).property('content.hasDetails')

  doCancel: (model)->
    if model.get('isNew')
      model.deleteRecord()
    tr = model.get('transaction')
    tr.rollback()
    tr.commit()
    model.resetState()
    tr.removeCleanRecords()
    @get('target').send('doCancel', model)
    return

  doSave: (model)->
    unless model.get('isValid')
      model.send('becameValid')
      model.set('isSaved', false)
    if not model.get('isDirty')
      model.set('isSaved', true)
      @set('sendToEvent', 'doSave')
    tr = model.get('transaction')
    tr.commit()
    tr.removeCleanRecords()
    return

  doDetails: (model) ->
    tr = model.get('transaction')
    tr.rollback()
    model.resetState()
    tr.removeCleanRecords()
    @get('target').send('doDetails', model, model)
    return

  modelObserver: (->
    model = @get('content')
    if @get('content.isSaved')
      model.resetState()
      @get('target').send('doSave', model)
  ).observes('content.isSaved')