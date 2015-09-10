Meteor.methods
  'addUser': (name) ->
    if Meteor.user()?
      check(name, String)
      user = Users.insert {
        name: name
        createdAt: new Date()
      }
  'addLog': (userId, type) ->
    check(type, String)

    if Meteor.user()?
      Logs.insert {
        userId: userId
        start: new Date()
        status: type
        end: null
      }
  'signIn': (userId) ->
    if Meteor.user()?
      lastLog = Logs.findOne({userId: userId}, {sort: {start: -1}})
      if lastLog?
        Logs.update({_id: lastLog._id}, {$set: {end: new Date()}})
  'removeLog': (logId) ->
    if Meteor.user()?
      if Meteor.user().emails[0].address == 'admin'
        Logs.remove({_id: logId})
  'removeUser': (userId) ->
    if Meteor.user()?
      if Meteor.user().emails[0].address == 'admin'
        Users.remove({_id: userId})
