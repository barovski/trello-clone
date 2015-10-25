Meteor.methods
  insertTask: (doc) ->
    Schema.Tasks.clean(doc)
    check(doc, Schema.Tasks)
    Tasks.insert(doc)
  updateTask: (doc) =>
    task = Tasks.findOne(doc._id) or isOwner: -> no
    if task.isOwner(Meteor.user())
      Schema.Tasks.clean(doc)
      check(doc, Schema.Tasks)
      Tasks.update task._id, $set: doc
  removeTask: (id) =>
    task = Tasks.findOne(id) or isOwner: -> no
    if task.isOwner(Meteor.user())
      Tasks.remove(id)
