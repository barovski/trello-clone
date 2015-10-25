Meteor.methods
  insertLane: (doc) ->
    Schema.Lanes.clean(doc)
    check(doc, Schema.Lanes)
    Lanes.insert(doc)
