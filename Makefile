
DESTDIR =
PREFIX = /usr/local
PROGRAM_PREFIX =

# On Windows, manually setting absolute path to Python binary may be required
# for launcher executable to work. From MSYS2, this can be done using the
# following command: "which python3 | cygpath -w -m -f -".
ifeq ($(OS), Windows_NT)
PYTHON = $(shell cygpath -w -m $(PREFIX)/bin/python3)
endif

build: src/eqy_combine.so src/eqy_partition.so src/eqy_recode.so

src/eqy_combine.so: src/eqy_combine.cc
	yosys-config --build $@ $^

src/eqy_partition.so: src/eqy_partition.cc
	yosys-config --build $@ $^

src/eqy_recode.so: src/eqy_recode.cc
	yosys-config --build $@ $^

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

clean:
	$(MAKE) -C docs clean
	$(MAKE) -C examples/simple clean
	rm -rf docs/build src/eqy_combine.so src/eqy_partition.so src/eqy_recode.so src/__pycache__
