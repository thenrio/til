{:ok, pid} = Postgrex.start_link(options)

Process.exit(pid, :normal)
=> has no effect, see https://crypt.codemancers.com/posts/2016-01-24-understanding-exit-signals-in-erlang-slash-elixir/

GenServer.stop(pid)
=> done with it.
