observer
========

```
iex(19)> :observer.start()
:ok
```

dbg
===
start tracer, have a Enum.join trace pattern, trace calls all pid.

```
iex(18)> :dbg.tracer()
{:ok, #PID<0.129.0>}
iex(19)> :dbg.tpl(Enum, :join, [])
{:ok, [{:matched, :nonode@nohost, 2}]}
iex(20)> :dbg.p(:all, :call)
{:ok, [{:matched, :nonode@nohost, 56}]}
```

```
iex(21)> Enum.join([1, 2], ":")
(<0.104.0>) call 'Elixir.Enum':join([1,2],<<":">>)
"1:2"
```

stop tracer, remove trace pattern.

```
iex(22)> :dbg.stop_clear()
:ok
```

match spec
----------
see http://erlang.org/doc/apps/erts/match_spec.html#functions-allowed-only-for-tracing

can also have

* return value

```
dbg.tpl(Enum, :join, [{:_, [], [{:return_trace}]}])
```

```
(<0.104.0>) call 'Elixir.Enum':join([1,2],<<">">>)
(<0.104.0>) returned from 'Elixir.Enum':join/2 -> <<"1>2">>
"1>2"
```

* match args

```
:dbg.tpl(Ecto.Adapters.Postgres.Connection, :expr, [{{{:in, :_, :_}, :_, :_}, [], []}])
```

here, match spec is `{{:in, :_, :_}, :_, :_}`, is same as pattern match `({:in, _, _}, _, _)`

* stack?

```
:dbg.tpl(Enum, :join, [{:_, [], [{:exception_trace}]}])
```

`:dbg.ctpl` removes the trace pattern.

see:

* http://erlang.org/doc/man/dbg.html#simple-examples---tracing-from-the-shell
* https://zorbash.com/post/debugging-elixir-applications/

trace to file?

```
:dbg.stop_clear()
:dbg.tracer(:port, :dbg.trace_port(:file, Path.expand("~/tmp/dbg.pcap") |> to_charlist()))
:dbg.tp(DBConnection.ConnectionPool, [])
:dbg.tp(DBConnection.Holder, [])
:dbg.p(:all, [:c, :timestamp])
```

see http://erlang.org/doc/man/erlang.html#trace-3

read file?

recon
-----

```
iex(10)> :recon_trace.calls({Postgrex.Protocol, :handle_prepare, :_}, 1)
1
iex(11)> {:ok, c} = Postgrex.prepare(pid, "c", "select (values($1::integer)) as i")

11:13:41.700193 <0.595.0> 'Elixir.Postgrex.Protocol':handle_prepare(#{'__struct__' => 'Elixir.Postgrex.Query',cache => reference,columns => nil,
  name => <<"c">>,param_formats => nil,param_oids => nil,param_types => nil,
  ref => nil,result_formats => nil,result_oids => nil,result_types => nil,
  statement => <<"select (values($1::integer)) as i">>,types => nil}, [{postgrex_prepare,true}], #{'__struct__' => 'Elixir.Postgrex.Protocol',buffer => <<>>,
  connection_id => 12455,connection_key => 646309963,
  disconnect_on_error_codes => [],null => nil,
  parameters => #Ref<0.874805759.2888302593.27740>,
  peer => {{127,0,0,1},5432},
  postgres => idle,queries => #Ref<0.874805759.2888433665.27737>,
  sock => {gen_tcp,#Port<0.700>},
  timeout => 15000,transactions => naive,
  types =>
      {'Elixir.Postgrex.DefaultTypes',#Ref<0.874805759.2888433665.27720>}})
Recon tracer rate limit tripped.
{:ok,
 %Postgrex.Query{
   cache: :reference,
   columns: ["i"],
   name: "c",
   param_formats: [:binary],
   param_oids: [23],
   param_types: [Postgrex.Extensions.Int4],
   ref: #Reference<0.874805759.2888302593.31818>,
   result_formats: [:binary],
   result_oids: [23],
   result_types: [Postgrex.Extensions.Int4],
   statement: "select (values($1::integer)) as i",
   types: {Postgrex.DefaultTypes, #Reference<0.874805759.2888433665.27720>}
 }}
```
