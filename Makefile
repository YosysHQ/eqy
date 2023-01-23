
DESTDIR =
PREFIX = /usr/local
PROGRAM_PREFIX =
YOSYS_CFGFLAGS =

# On Windows, manually setting absolute path to Python binary may be required
# for launcher executable to work. From MSYS2, this can be done using the
# following command: "which python3 | cygpath -w -m -f -".
ifeq ($(OS), Windows_NT)
PYTHON = $(shell cygpath -w -m $(PREFIX)/bin/python3)
endif

build: src/eqy_combine.so src/eqy_partition.so src/eqy_recode.so

DEBUG_CXXFLAGS :=
#DEBUG_CXXFLAGS += -Og
COVERAGE := 0
ifeq ($(COVERAGE),1)
YOSYS_CFGFLAGS += --coverage
endif

src/eqy_combine.so: src/eqy_combine.cc
	yosys-config --build $@ $(DEBUG_CXXFLAGS) $^ $(YOSYS_CFGFLAGS)

src/eqy_partition.so: src/eqy_partition.cc
	yosys-config --build $@ $(DEBUG_CXXFLAGS) $^ $(YOSYS_CFGFLAGS)

src/eqy_recode.so: src/eqy_recode.cc
	yosys-config --build $@ $(DEBUG_CXXFLAGS) $^ $(YOSYS_CFGFLAGS)

install: src/eqy_combine.so src/eqy_partition.so src/eqy_recode.so
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	mkdir -p $(DESTDIR)$(PREFIX)/share/yosys/python3
	mkdir -p $(DESTDIR)$(PREFIX)/share/yosys/plugins
	cp src/eqy_job.py $(DESTDIR)$(PREFIX)/share/yosys/python3/
	cp src/eqy_combine.so $(DESTDIR)$(PREFIX)/share/yosys/plugins/
	cp src/eqy_partition.so $(DESTDIR)$(PREFIX)/share/yosys/plugins/
	cp src/eqy_recode.so $(DESTDIR)$(PREFIX)/share/yosys/plugins/
ifeq ($(OS), Windows_NT)
	sed -e 's|##yosys-sys-path##|sys.path += [os.path.dirname(__file__) + p for p in ["/share/python3", "/../share/yosys/python3"]]|;' \
		-e "s|#!/usr/bin/env python3|#!$(PYTHON)|" < src/eqy.py > $(DESTDIR)$(PREFIX)/bin/eqy-script.py
	gcc -DGUI=0 -O -s -o $(DESTDIR)$(PREFIX)/bin/eqy.exe extern/launcher.c
else
	sed 's|##yosys-sys-path##|sys.path += [os.path.dirname(__file__) + p for p in ["/share/python3", "/../share/yosys/python3"]]|;' < src/eqy.py > $(DESTDIR)$(PREFIX)/bin/eqy
	chmod +x $(DESTDIR)$(PREFIX)/bin/eqy
endif

html:
	$(MAKE) -C docs html

test:
	$(MAKE) -C examples/simple clean
	$(MAKE) -C examples/simple

coverage:
	rm -rf coverage.info coverage_html .coverage coverage.lcov
	-$(MAKE) COVERAGE_FILE="$$PWD/.coverage" EQY="coverage run -a $$PWD/src/eqy.py" -C examples/simple clean test
	-$(MAKE) COVERAGE_FILE="$$PWD/.coverage" EQY="coverage run -a $$PWD/src/eqy.py" -C examples/nerv clean test
	-$(MAKE) COVERAGE_FILE="$$PWD/.coverage" EQY="coverage run -a $$PWD/src/eqy.py" -C examples/risc16f84 clean test
	-$(MAKE) COVERAGE_FILE="$$PWD/.coverage" EQY="coverage run -a $$PWD/src/eqy.py" -C tests/python clean test
	+cd tests/plugin && bash run-test.sh
	lcov --capture -d . --no-external -o coverage.info --gcov-tool $$PWD/llvm-gcov.sh
	coverage report --omit=*/dist-packages/*
	coverage lcov --omit=*/dist-packages/*
	cat coverage.lcov >> coverage.info
	genhtml coverage.info --output-directory coverage_html

clean:
	$(MAKE) -C docs clean
	$(MAKE) -C examples/simple clean
	$(MAKE) -C examples/nerv clean
	find . -name "*.gcda" -type f -delete
	find . -name "*.gcno" -type f -delete
	rm -rf docs/build src/eqy_combine.so src/eqy_partition.so src/eqy_recode.so src/__pycache__ coverage.info coverage_html .coverage coverage.lcov
