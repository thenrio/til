observer
========

		iex(19)> :observer.start()
		:ok

dbg
===

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


