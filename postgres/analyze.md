From thread "effect on planner of turning a subquery to a table, sql function returning table", 2024/04/12

> To be able to determine if a plan is good or bad, we'd really need to
> see the EXPLAIN (ANALYZE) output rather than just the EXPLAIN ouput.
> 
> To save a possible roundtrip;
> 
> SET track_io_timing = ON;
> EXPLAIN (ANALYZE, BUFFERS) <the query>
