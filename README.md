This project is a simple Rails CRUD app that lists a couple of notes from a fake online API.

To execute it, first install the dependencies:

```
bundle install
```

Then, start the project via `rails s` command.

To stress the views, you'll need the [hey](https://github.com/rakyll/hey) tool.

Commands:
```
$ hey http://localhost:3000/notes_erb/index

$ hey http://localhost:3000/notes_haml/index

$ hey http://localhost:3000/notes_slim/index
```
