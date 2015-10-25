Meteor.publish 'my-boards', ->
  user = Meteor.users.findOne this.userId
  check(user, Object)

  Boards.find
   owner: user.username

Meteor.publishComposite 'board', (id) ->
  find: ->
    Boards.find(id)
  children: [
    find: (board) ->
      Lanes.find(board: board._id)
  ]
