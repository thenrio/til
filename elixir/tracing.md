observer
========

```
iex(19)> :observer.start()
:ok
```

dbg
===

```
iex(1)> Dbg.trace( self, :call )
%{counts: %{nonode@nohost: 1}, errors: %{}}
iex(2)> Dbg.call( Postgrex, [:return] )
%{counts: %{nonode@nohost: 26}, errors: %{}, saved: 1}
iex(3)> {:ok, pid} = Postgrex.start_link(hostname: "localhost", username: "queen", password: "honey", database: "hive2")

** (Dbg) #PID<0.1034.0> calls Postgrex.__info__/1 with arguments:
		[:macros]

** (Dbg) #PID<0.1034.0> Postgrex.__info__/1 returns:
		[]

** (Dbg) #PID<0.1034.0> calls Postgrex.start_link/1 with arguments:
		[[hostname: "localhost", username: "queen", password: "honey", database: "hive2"]]
{:ok, #PID<0.1039.0>}

** (Dbg) #PID<0.1034.0> Postgrex.start_link/1 returns:
		{:ok, #PID<0.1039.0>}
```

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
