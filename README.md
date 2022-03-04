## Dependencies

You must have redis installed and running on the default port:6379 (or configure it in config/redis/cable.yml).

##### On Mac
* `brew install redis`
* 
*

ou must have mailcatcher installed and running on the default ports

##### On Mac
* `gem install mailcatcher` 

###### Note: You must have Ruby 2.3.0 installed in order to use redis

## Starting the servers

1. Run `./bin/setup`
2. Run `./bin/cable`
3. Open up a separate terminal and run: `./bin/rails server`
4. One more terminal to run redis server: `redis-server`
5. Visit `http://localhost:3000/team/chats`
6. Visit `http://localhost:3000/chats/new`
#
