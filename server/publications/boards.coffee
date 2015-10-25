Meteor.publish 'my-boards', ->
  user = Meteor.users.findOne this.userId
  console.log user
  check(user, Object)

  Boards.find
   owner: user.username
   
