Meteor.methods
  insertTask: (doc) ->
    Schema.Tasks.clean(doc)
    check(doc, Schema.Tasks)
    Tasks.insert(doc)
  updateTask: (doc) ->
    check(Meteor.user(), Object)
    task = Tasks.findOne(doc._id) or {}
    lane = Lanes.findOne(task.lane) or {}
    board = Boards.findOne(lane.board) or {}
    if board.owner == Meteor.user().username
      Schema.Tasks.clean(doc)
      check(doc, Schema.Tasks)
      Tasks.update task._id, $set: doc
