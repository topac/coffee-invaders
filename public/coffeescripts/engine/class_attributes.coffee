class fi.ClassAttributes
  _classesAttributes = []

  @classAttributes: (object=null)->
    if object
      for classAttributes in _classesAttributes
        return Object.merge(classAttributes, object) if @ is classAttributes.__class
      _classesAttributes.push Object.merge({__class: @}, object)
    else
      for classAttributes in _classesAttributes
        return classAttributes if @ is classAttributes.__class
      null

  class: ->
    return @_class if @_class
    for object in _classesAttributes
      return @_class = object if @ instanceof object.__class
    null
