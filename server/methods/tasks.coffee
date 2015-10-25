Meteor.methods
  insertTask: (doc) ->
    Schema.Tasks.clean(doc)
    check(doc, Schema.Tasks)
    Tasks.insert(doc)
