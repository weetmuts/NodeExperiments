SPEC=$(wildcard build/*/spec.gmk)
ifeq (,$(SPEC))
    $(error Run configure first.)
endif

include $(SPEC)

all: package

package: $(OUTPUT_ROOT)/time.packaged

install: $(OUTPUT_ROOT)/time.installed

lint:
	@echo Linting...

audit:
	@echo Auditing...

$(OUTPUT_ROOT)/time.packaged: $(OUTPUT_ROOT)/time.compiled
	@echo Packaging...
	@touch $@

$(OUTPUT_ROOT)/time.compiled: $(OUTPUT_ROOT)/time.installed
	@echo Compiling...
	@touch $@

$(OUTPUT_ROOT)/time.installed: package.json
	@echo Installing dependencies...
	@$(xNPM) install $(xNPM_FLAGS)
	@touch $@

test:
	@$(xNPM) test

publish:
	npm login
	npm publish

clean:
	rm -rf build autom4te.cache

.PHONY: all package install audit
