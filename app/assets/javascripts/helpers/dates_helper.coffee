Ember.Object.reopen

  fmtDate: (object, property)->
    value = object.get(property)
    if value
      value = moment(value).format('MM.DD.YYYY')
    value

  fmtDateLong: (object, property)->
    value = object.get(property)
    if value
      value = moment(value).format('ddd Do MMMM YYYY')
    value

  stringToDate: (string)->
    moment(string, 'MM.DD.YYYY').eod().toDate()

Ember.ObjectController.reopen
  dateToStringShort: (property)->
    date = @get(property)
    if date
      return moment(date).eod().format('MM.DD.YYYY')

  dateToStringLong: (property)->
    date = @get(property)
    if date
      return moment(date).eod().format('MM.DD.YYYY')