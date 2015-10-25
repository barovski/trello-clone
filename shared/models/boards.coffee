@Boards = new Mongo.Collection('boards')
@Boards.attachSchema @Schema.Boards
@Boards.helpers
  isOwner: (user) ->
    user = user or username: ''
    this.owner == user.username
