Template.status.helpers
  'statStyle': () ->
    current = share.getUserStatus(@_id).status
    switch current
      when "IN" then result = ''
      when "OUT" then result = 'warning'
      when "OFF" then result = 'danger'

    return result

  'stat': () ->
    current = share.getUserStatus(@_id)
    date = current.time.toLocaleString()
    switch current.status
      when "IN" then result = 'ON CAMP as of ' + date
      when "OUT" then result = 'SIGNED OUT as of ' + date
      when "OFF" then result = 'DAY OFF as of ' + date
    return result

  'in': () ->
    current = share.getUserStatus(@_id)
    return current.status == "IN"

Template.status.events
  'click .hour-off': (e) ->
    Meteor.call('addLog', @_id, 'OUT')
    
  'click .day-off': (e) ->
    Meteor.call('addLog', @_id, 'OFF')

  'click .sign-in': (e) ->
    Meteor.call('signIn', @_id)

  'click .delete-user': () ->
    Meteor.call('removeUser', @_id)
