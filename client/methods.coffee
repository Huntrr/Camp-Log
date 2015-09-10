share.getUserStatus = (userId) ->
  latestLog = Logs.findOne({userId: userId}, {sort: {start: -1}})
  if latestLog?
    if not latestLog.end?
      return {status: latestLog.status, time: latestLog.start}
    else
      return {status: "IN", time: latestLog.end}
  else
    user = Users.findOne({_id: userId})
    if user?
      return {status: "IN", time: user.createdAt}
    else return {status: "IN", time: new Date}
