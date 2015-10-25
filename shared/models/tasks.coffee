@Tasks = new Mongo.Collection('tasks')
@Tasks.attachSchema(Schema.Tasks)
@Tasks.helpers
 isOwner: (user) ->
   user = user or username: ''
   lane = Lanes.findOne(this.lane) or isOwner: -> no
   lane.isOwner(user)
