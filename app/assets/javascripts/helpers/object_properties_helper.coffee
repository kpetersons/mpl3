Ember.Object.reopen
  date_field_property: (object, field, args, key, value) ->
    if args == 1
      return @fmtDate(object, field)
    else
      if value
        object.set(field, @stringToDate(value));
        return @fmtDate(object, field)
      return value

  number_field_property: (object, field, args, key, value) ->
    if args == 1
      if object.get(field)
        return accounting.formatMoney(object.get(field), '')
      else
        return accounting.formatMoney(0, '')
    else
      value = value || 0
      if value
        object.set(field, accounting.formatMoney(value, ''))
        return accounting.formatMoney(object.get(field), '')
      return value

  classifier_field_property: (object, field, classifier, classifierField, args, key, value) ->
    if args == 1
      if object.get(field)
        return object.get(field).get(classifierField)
    else
      if value
        object.set(field, @get(classifier).findProperty(classifierField, value));
      return value