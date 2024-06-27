name = "x"
version = 1.0.0

.PHONY: all do undo run status

all:
	@echo "${name} v${version}"

do:
	@chmod -x ${TARGET}
	@echo "do: success"

undo:
	@chmod +x ${TARGET}
	@echo "undo: success"

run:
	@if [ ! -x ${TARGET} ]; then \
		$(MAKE) -f ${MAKEFILE_LIST} -s undo > /dev/null 2>&1; \
		${TARGET} ${ARGS}; \
		$(MAKE) -f ${MAKEFILE_LIST} -s do > /dev/null 2>&1; \
	fi

status:
	@if [ -x ${TARGET} ]; then \
		echo "Activated"; \
	else \
		echo "Disactivated"; \
	fi
