### Manage a Queue from redis-cli

redis-cli

```
select 0 # (or whichever namespace Sidekiq is using)
keys * # (just to get an idea of what you're working with)
smembers queues
lrange queue:queue_name 0 -1 # (queue_name must be your relevant queue)
lrem queue:queue_name -1 "payload"
```
### Redis
```
if value is of type string -> GET <key>
if value is of type hash -> HGETALL <key>
if value is of type lists -> lrange <key> <start> <end>
if value is of type sets -> smembers <key>
if value is of type sorted sets -> ZRANGEBYSCORE <key> <min> <max>

SCARD key
Returns the set cardinality (number of elements) of the set stored at
```
  
###Redis + Rails + Sidekiq 
https://www.youtube.com/watch?v=bu7A0hYy2No

###Best pratices with Sidekiq
https://github.com/mperham/sidekiq/wiki/Best-Practices#3-embrace-concurrency

###Using Redis with Sidekiq
https://github.com/mperham/sidekiq/wiki/Using-Redis

###Error handling Sidekiq
https://github.com/mperham/sidekiq/wiki/Error-Handling
