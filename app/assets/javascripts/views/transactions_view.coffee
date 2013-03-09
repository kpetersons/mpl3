Mpl2.TransactionsNewView = Mpl2.ModalView.extend

  setUpUI: ->
    _self = @
    @_super()
    @open()
    $('.fast-date_when').datepicker(
      format: 'mm.dd.yyyy'
    ).on('changeDate', (evt) ->
      $(evt.target).datepicker('hide')
    )
    $('.fast-account').typeahead(
      source: (typeahead, query) ->
        _self.get('controller.accounts').getEach('name')
      items: 3
      minLength: 1
    )
    $('.fast-category').typeahead(
      source: (typeahead, query) ->
        _self.get('controller.categories').getEach('name')
      items: 3
      minLength: 1
    )

  destroyUI: ->
    @close()

Mpl2.TransactionEditView = Mpl2.TransactionsNewView.extend()
Mpl2.TransactionDeleteView = Mpl2.TransactionEditView.extend()

Mpl2.AccountTransactionEditView = Mpl2.TransactionEditView.extend()
Mpl2.AccountTransactionsNewView = Mpl2.TransactionsNewView.extend()

Mpl2.AimTransactionEditView = Mpl2.TransactionEditView.extend()
Mpl2.AimTransactionsNewView = Mpl2.TransactionsNewView.extend()

Mpl2.CategoryTransactionEditView = Mpl2.TransactionEditView.extend()
Mpl2.CategoryTransactionsNewView = Mpl2.TransactionsNewView.extend()