Demo project to help debug issue:  https://github.com/rails/rails/issues/31200


Found the issue to be the `gon` gem.


### Working scenario

1. edit Gemfile, remove (comment) the `gon` gem
2. `bundle`
3. `bin/rails s`
4. (in another terminal) `curl -v 'http://localhost:3000/download'`

=> all ok!

### Faulty scenario

1. edit Gemfile, add the `gon` gem
2. `bundle`
3. `bin/rails s`
4. (in another terminal) `curl -v 'http://localhost:3000/download'`

=> will hang, sometimes need to send SIGKILL to puma to shutdown
