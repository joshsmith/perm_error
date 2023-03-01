vol_dir = System.get_env("VOL_DIR") || "./"

Application.put_env(:mnesia, :dir, to_charlist(vol_dir))


:ok = Application.start(:mnesia)

dbg(:mnesia.change_table_copy_type(:schema, node(), :disc_copies))

path = Path.join([vol_dir, "hello.txt"])
File.write!(path, "Hello from elixir!")
IO.puts(File.read!(path))
