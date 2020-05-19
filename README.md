Manage a Queue from redis-cli

redis-cli
> select 0 # (or whichever namespace Sidekiq is using)
> keys * # (just to get an idea of what you're working with)
> smembers queues
> lrange queue:queue_name 0 -1 # (queue_name must be your relevant queue)
> lrem queue:queue_name -1 "payload"

https://www.youtube.com/watch?v=bu7A0hYy2No
