@Schema = {}
@Schema.Boards = new SimpleSchema
  name:
    type: String
    max: 25
  isPublic:
    type: Boolean
    defaultValue: no
  owner:
    type: String
  members:
    type: [String]
    defaultValue: []

@Schema.Lanes = new SimpleSchema
  name:
    type: String
    max: 25
    defaultValue: 'lane'
  board:
    type: String

@Schema.Tasks = new SimpleSchema
  task:
    type: String
  lane:
    type: String
