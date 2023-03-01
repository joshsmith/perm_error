config = [ttl: :timer.minutes(30), writes: :sync]
:timer.sleep(:timer.seconds(1))
dbg Application.get_env(:mnesia, :dir)
dbg Pow.Store.Backend.MnesiaCache.all(config, :_)
dbg Pow.Store.Backend.MnesiaCache.put(config, {:key1, 1})
dbg Pow.Store.Backend.MnesiaCache.put(config, {:key2, 2})
dbg Pow.Store.Backend.MnesiaCache.all(config, :_)
:timer.sleep(:timer.seconds(1))
