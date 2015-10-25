Meteor.methods
  insertBoard: (doc) ->
    user = Meteor.user()
    check(user, Object)
    Schema.Boards.clean(doc)
    doc.owner = user.username
    check(doc, Schema.Boards)
    Boards.insert(doc)
  removeBoard: (id) ->
    board = Boards.findOne(id) or isOwner: -> no
    if board.isOwner(Meteor.user())
      Boards.remove(id)
      lanes = Lanes.find(board: id).fetch()
      Lanes.remove(board: id)
      _.each lanes, (lane) =>
        Tasks.remove lane: lane._id        
