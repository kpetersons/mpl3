Mpl2.Router.map (match) ->

  @route 'home'
  @resource 'accounts', ->
    @route 'new'
    @resource 'account', path: ':account_id', ->
      @route 'edit',      path: 'edit'
      @route 'details',   path: 'details'
      @resource 'account.transactions', ->
        @route 'new',   path: 'new'
        @resource 'account.transaction', path: ':transaction_id', ->
          @route 'edit',   path: 'edit'
  @resource 'aims', ->
    @route 'new'
    @resource 'aim', path: ':aim_id', ->
      @route 'edit',      path: 'edit'
      @route 'details',   path: 'details'
      @resource 'aim.transactions', ->
        @route 'new',   path: 'new'
        @resource 'aim.transaction', path: ':transaction_id', ->
          @route 'edit',   path: 'edit'
  @resource 'categories', ->
    @route 'group',             path: 'group'
    @route 'newIncome',         path: 'income/new'
    @route 'newExpense',        path: 'expense/new'
    @resource 'category', path: ':category_id', ->
      @route 'edit',      path: 'edit'
      @route 'details',   path: 'details'
      @route 'delete',    path: 'delete'
      @resource 'category.transactions', ->
        @route 'new',   path: 'new'
        @resource 'category.transaction', path: ':transaction_id', ->
          @route 'edit',   path: 'edit'
  @resource 'transactions', ->
    @route 'new'
    @resource 'transaction', path: ':transaction_id', ->
      @route 'edit',   path: 'edit'
      @route 'delete', path: 'delete'
  @resource 'plans', ->
    @route 'index'
    @route 'new'
    @resource 'plan', path: ':plan_id', ->
      @route 'edit',      path: 'edit'
      @route 'details',   path: 'details'
  @resource 'settings'

  events:
    doSignOut:  (router, event)  ->
      $.ajax 
        url: '/sign_out',
        type: 'DELETE',
        success:  (result)  ->
          $ 'body>.container' .empty  
          window.location.replace result.url

Ember.Route.reopen
  enter: ->
    console.log 'Router enter', @
    @_super()