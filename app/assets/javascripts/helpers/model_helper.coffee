DS.Model.reopen

#  hasDetails: false
#  isSaved: null
#  isCanceled: null
#
#  didCreate: ->
#    @set('isSaved', true)
#
#  didUpdate: ->
#    @set('isSaved', true)

  resetState: ->
    @set('isSaved', null)
    @set('isCanceled', null)
    @set('errorData', Ember.Object.create())

  modelErrors: (->
    unless @get('errors')
      return
    origErrMessages = @get('errors')
    errMessages = Ember.A()
    @set('errorData', Ember.Object.create())
    for property of origErrMessages
      errMessages.pushObject(Ember.Object.create(name: property, message: origErrMessages[property][0]))
      property = property.replace('_id', '').classify().capitalize()
      @set('errorData.is'+property.capitalize()+'Error', true)
    errMessages
  ).property('errors')
