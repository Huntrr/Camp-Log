Template.log.helpers
  'logStyle': () ->
    switch @status
      when "OUT" then result = 'warning'
      when "OFF" then result = 'danger'
    return result

  'parseType': () ->
    switch @status
      when "OUT" then result = 'HOUR/NIGHT OFF'
      when "OFF" then result = 'DAY OFF'
    return result

  'parseStart': () -> @start.toLocaleString()

  'parseEnd': () ->
    if @end?
      return @end.toLocaleString()
    else
      return 'not signed in yet'

Template.log.events
  'click .delete-log': () ->
    Meteor.call('removeLog', @_id)
