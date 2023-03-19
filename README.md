# Course

A project which tracks Course, Learning Paths and Talents.

# Ruby Version
`3.0.0`

## Install
- clone the project
- If you don't have the compatible version of ruby use the command to install this using [rbenv](https://github.com/rbenv/rbenv)
```shell
rbenv install 3.0.0
```
**Note**: You can find installed ruby version in your system with the below command:
```shell
ruby -v
```
- install dependencies using [Bundler](https://github.com/bundler/bundler) 
```shell 
bundle install
```

## DB Diagram




## APIs
You can see the APIs in [APIs.md](APIs.md)

## Architecture
For implement this project I've used Service Object Pattern but not everywhere, In which we want to do something more than CRUD.


## TODO
- It can have an authentication service
- Track user courses in better way(In this just we track learning path courses)
- Use Syntactic sugar in service objects

