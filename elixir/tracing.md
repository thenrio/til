dbg
===
start tracer, have a Enum.join trace pattern, trace calls all pid.

```elixir
:dbg.tracer()
:dbg.p(:all, :c)
:dbg.tp({Gettext, :dgettext, 4}, :cx)
```

See https://www.erlang.org/doc/apps/runtime_tools/dbg.html#ltp/0

on a remote node (remsh)
------------------------

```elixir
:dbg.start()
:dbg.tracer(:process, {fn (msg, n) -> IO.inspect(msg); n+1 end, 0})
:dbg.p(:all, :c)
:dbg.tp({Gettext, :dgettext, 4}, :cx)
```

Otherwise, the remote node gets the trace :(

> https://nobilisdata.com/til/use-dbg-in-remote-shell/
