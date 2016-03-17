TL;DR
=====

		PGUSER=postgres PGPASSWORD=postgres mix test

it is almost as in .travis.yml file

> omitting PGPASSWORD=postgres makes red for me
>

dedicated user
==============

see http://stackoverflow.com/questions/18664074/getting-error-peer-authentication-failed-for-user-postgres-when-trying-to-ge

	postgres@www0:~$ createuser --interactive -P someuser
			Enter password for new role:
			Enter it again:
			Shall the new role be a superuser? (y/n) n
			Shall the new role be allowed to create databases? (y/n) y
			Shall the new role be allowed to create more new roles? (y/n) n

			postgres@www0:~$ createdb -O someuser database

			postgres@www0:~$ psql -U someuser -h 127.0.0.1 database

hack system hba
===============

done it on a branch, the diff are terrible!
-------------------------------------------

		/etc/postgresql/9.5/main [postgrex]$ git diff master
		diff --git a/pg_hba.conf b/pg_hba.conf
		index b708a88..ad1aec6 100644
		--- a/pg_hba.conf
		+++ b/pg_hba.conf
		@@ -71,9 +71,9 @@
		# "host" records.  In that case you will also need to make PostgreSQL
		# listen on a non-local interface via the listen_addresses
		# configuration parameter, or via the -i or -h command line switches.
		-
		-
		-
		+host    all             postgrex_md5_pw         127.0.0.1/32    md5
		+host    all             postgrex_cleartext_pw   127.0.0.1/32    password
		+host    all             thenrio                 127.0.0.1/32    trust
		
		# DO NOT DISABLE!
		# If you change this first entry you will need to make sure that the
		@@ -82,7 +82,7 @@
		# maintenance (custom daily cronjobs, replication, and similar tasks).
		#
		# Database administrative login by Unix domain socket
		-local   all             postgres                                peer
		+local   all             postgres                                trust
		
		# TYPE  DATABASE        USER            ADDRESS                 METHOD


create a dedicated role $USER
------------------------------

	sudo -u postgres createuser thenrio


postgres password
-----------------
some test assumes postgres will connect on host

		mix test test/login_test.exs:52

	  13:05:56.707 [error] Postgrex.Protocol (#PID<0.154.0>) failed to connect: ** (Postgrex.Error) FATAL (invalid_password): password authentication failed for user "postgres"	

then

		psql -U postgres -c "alter user postgres with password 'postgres'"

$USER does not have privilege on schema test of database
---------------------------------------------------------

	~/src/elixir/postgrex [master]$ mix test test/schema_test.exs:20
	Including tags: [line: "20"]
	Excluding tags: [:test]



		1) test decode hstore inside a schema (SchemaTest)
			test/schema_test.exs:20
			match (=) failed
			code: [[%{}]] = query(~s"SELECT ''::test.hstore", [])
			rhs:  %Postgrex.Error{connection_id: 22156, message: nil,
							postgres: %{code: :insufficient_privilege, file: "aclchk.c", line: "3362", message: "permission denied for schema test", pg_code: "42501",
								position: "12", routine: "aclcheck_error", severity: "ERROR"}}
			stacktrace:
				test/schema_test.exs:21



	Finished in 1.3 seconds (1.3s on load, 0.06s on tests)
	2 tests, 1 failure, 1 skipped

	Randomized with seed 357428

grant?

		psql -U postgres postgrex_test_with_schemas -c "GRANT ALL ON SCHEMA test TO thenrio"

is a fail for me : `postgrex_test` and `postgrex_test_with_schemas` are dropped at test setup...
