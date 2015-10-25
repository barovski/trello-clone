Meteor.methods
  insertBoard: (doc) ->
    user = Meteor.user()
    check(user, Object)
    Schema.Boards.clean(doc)
    doc.owner = user.username
    check(doc, Schema.Boards)
    Boards.insert(doc)
