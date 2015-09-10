Template.home.helpers
  'personName': () -> Session.get 'personName'
  'isName': () ->
    if Session.get 'personName'
      return Session.get('personName').length > 0
    return false
  'users': () ->
    if Session.get('personName')?
      Users.find(name: {$regex: '.*'+Session.get('personName')+'.*', $options: 'i' }, {sort: {name: 1}, limit: 10})
    else
      Users.find({}, {sort: {name: 1}, limit: LIMIT})

Template.home.events 
  'input #personName': (e) ->
    Session.set 'personName', $('#personName').val()
  'click #add-user': (e) ->
    name = Session.get 'personName'
    console.log name
    if name.length > 1
      Meteor.call('addUser', name)

      $('#personName').val('')
      Session.set 'personName', ''
