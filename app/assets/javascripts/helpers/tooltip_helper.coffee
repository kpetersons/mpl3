Ember.View.reopen
  addTooltip: ->
    $('[title]').tooltip()

  didInsertElement: ->
    @addTooltip()