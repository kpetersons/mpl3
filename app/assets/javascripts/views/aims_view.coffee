Mpl2.AimsNewView = Mpl2.ModalView.extend

  setUpUI: ->
    _self = @
    @_super()
    @open()
    $('.fast-date_from').datepicker(
      format: 'mm.dd.yyyy'
    ).on('changeDate', (evt) ->
      $(evt.target).datepicker('hide')
    )
    $('.fast-date_target').datepicker(
      format: 'mm.dd.yyyy'
    ).on('changeDate', (evt) ->
      $(evt.target).datepicker('hide')
    )
    $('.fast-category').typeahead(
      source: (typeahead, query) ->
        _self.get('controller.categories').getEach('name')
      items: 3
      minLength: 1
    )

  destroyUI: ->
    @close()

Mpl2.AimEditView = Mpl2.AimsNewView.extend()