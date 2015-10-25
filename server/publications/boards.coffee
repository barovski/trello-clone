Meteor.publish 'my-boards', ->
  user = Meteor.users.findOne this.userId
  check(user, Object)

  Boards.find
   owner: user.username

Meteor.publishComposite 'board', (id) ->
  find: ->
    Boards.find(id)
