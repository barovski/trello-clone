Meteor.methods
  insertLane: (doc) ->
    Schema.Lanes.clean(doc)
    check(doc, Schema.Lanes)
    Lanes.insert(doc)
  updateLane: (doc) ->
    lane = Lanes.findOne(doc._id) or isOwner -> no
    if lane.isOwner(Meteor.user())
      Lanes.update(doc._id, $set: doc)