
PREFIX  ?= /usr/local
DESTDIR ?= 

bin     = tcalc
manual  = tcalc.1
man_src = tcalc.man

bin_dir = ${DESTDIR}${PREFIX}/bin
man_dir = ${DESTDIR}${PREFIX}/man/man1

all: ${manual}

${manual}: ${man_src}
	grutatxt -m man -s 1 -t ${bin} < ${man_src} > ${manual}

install: ${manual}
	@if [ ! -d "${bin_dir}" ]; \
	then \
		echo "mkdir -p ${bin_dir}"; \
		mkdir -p ${bin_dir}; \
	fi
		
	@if [ ! -d "${man_dir}" ]; \
	then \
		echo "mkdir -p ${man_dir}"; \
		mkdir -p ${man_dir}; \
	fi

	install -m 555 ${bin} ${bin_dir}
	install -m 444 ${manual} ${man_dir}
	
uninstall:
	rm -f ${bin_dir}/${bin}
	rm -f ${man_dir}/${manual}

clean:
	rm -f ${manual}

