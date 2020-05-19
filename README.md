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
```
  
Redis + Rails + Sidekiq -> https://www.youtube.com/watch?v=bu7A0hYy2No
