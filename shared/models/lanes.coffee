@Lanes = new Mongo.Collection('lanes')
@Lanes.attachSchema(Schema.Lanes)
@Lanes.helpers
 isOwner: (user) ->
   user = user or username: ''
   board = Boards.findOne(this.board) or isOwner: -> no
   board.isOwner(user)
