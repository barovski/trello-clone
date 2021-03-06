Meteor.methods
  insertLane: (doc) ->
    Schema.Lanes.clean(doc)
    check(doc, Schema.Lanes)
    board = Boards.findOne(doc.board) or isOwner: -> no
    if board.isOwner(Meteor.user())
      Lanes.insert(doc)
  updateLane: (doc) ->
    lane = Lanes.findOne(doc._id) or isOwner -> no
    if lane.isOwner(Meteor.user())
      Lanes.update(doc._id, $set: doc)
  removeLane: (id) ->
    lane = Lanes.findOne(id) or isOwner -> no
    if lane.isOwner(Meteor.user())
      Lanes.remove(id)
      Tasks.remove(lane: id)
