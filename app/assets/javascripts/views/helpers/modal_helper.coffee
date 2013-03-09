Mpl2.ModalView = Ember.View.extend
  classNames: ['modal']

  setUpUI: Ember.K()
  destroyUI: Ember.K()

  didInsertElement: ->
    @setUpUI()

  willDestroyElement: ->
    @destroyUI()

  open: ->
    _self = @
    @$().modal(
      backdrop: 'static'
      keyboard: false
      show: true
    )

  close: ->
    @$().modal('hide')