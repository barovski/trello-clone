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