Mpl2.CategoriesMergeView = Mpl2.ModalView.extend

  templateName: 'categories/merge'

  setUpUI: ->
    @open()

  destroyUI: ->
    @close()

Mpl2.CategoriesNewView = Mpl2.ModalView.extend

  templateName: 'categories/new'

  setUpUI: ->
    @open()

  destroyUI: ->
    @close()

Mpl2.CategoriesNewIncomeView = Mpl2.CategoriesNewView.extend()
Mpl2.CategoriesNewExpenseView = Mpl2.CategoriesNewView.extend()

Mpl2.CategoriesGroupView = Mpl2.ModalView.extend(
  templateName: 'categories/group'
  setUpUI: ->
    @open()

  destroyUI: ->
    @close()
)

Mpl2.CategoryDeleteView = Mpl2.ModalView.extend(
  setUpUI: ->
    @open()

  destroyUI: ->
    @close()
)

Mpl2.CategoryEditView = Mpl2.CategoriesNewView.extend(

  setUpUI: ->
    @_super()

    $('.fast-date_when').datepicker(
      format: 'mm.dd.yyyy'
    ).on('changeDate', (evt) ->
      $(evt.target).datepicker('hide')
    )
)