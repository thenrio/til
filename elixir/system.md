
what is the time resolution of system ?

    iex(18)> :erlang.system_info( :os_system_time_source)
    [function: :clock_gettime, clock_id: :CLOCK_REALTIME, resolution: 1000000000, parallel: :yes, time: 1459506635329387929]

resolution == 1 second

    iex(30)> :erlang.convert_time_unit( 1, :seconds, :native ) == :proplists.get_value( :resolution, :erlang.system_info( :os_system_time_source ) )
    true

