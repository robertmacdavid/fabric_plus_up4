tofino-build:
	./tofino-build.sh # fabric-spgw

build:
	cd p4src && ./bmv2-compile.sh

check:
	./run_tests.sh
