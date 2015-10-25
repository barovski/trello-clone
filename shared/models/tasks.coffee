@Tasks = new Mongo.Collection('tasks')
@Tasks.attachSchema(Schema.Tasks)
