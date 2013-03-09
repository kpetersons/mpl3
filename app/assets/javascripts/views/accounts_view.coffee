Mpl2.AccountsNewView = Mpl2.ModalView.extend

  setUpUI: ->
    _self = @
    @_super()
    @open()
    $('.fast-end_date').datepicker(
      format: 'mm.dd.yyyy'
    ).on('changeDate', (evt) ->
      $(evt.target).datepicker('hide')
    )

  destroyUI: ->
    @close()

Mpl2.AccountEditView = Mpl2.AccountsNewView.extend()