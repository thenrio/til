apk default to cache

		apk add man
		ERROR: unsatisfiable constraints:
		man (missing):
			required by: world[man]

resolution

		apk add --no-cache man
		fetch http://alpine.gliderlabs.com/alpine/v3.4/main/x86_64/APKINDEX.tar.gz
		fetch http://alpine.gliderlabs.com/alpine/v3.4/community/x86_64/APKINDEX.tar.gz
		(1/3) Installing sqlite-libs (3.13.0-r0)
		(2/3) Installing mdocml (1.13.3-r6)
		(3/3) Installing man (1.13.3-r6)

or

		apk update && apk add man

build-essential -> build-base (see https://github.com/gliderlabs/docker-alpine/issues/24)
