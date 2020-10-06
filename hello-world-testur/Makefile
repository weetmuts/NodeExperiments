SPEC=$(wildcard build/*/spec.gmk)
ifeq (,$(SPEC))
    $(error Run configure first.)
endif

include $(SPEC)

JS_SOURCES:=index.js $(shell find src -name "*.js") $(shell find lib -name "*.js")

PACKAGE_NAME:=$(shell cat package.json | json name)
PACKAGE_VERSION:=$(shell cat package.json | json version)
PACKAGE_TGZ_NAME:=$(PACKAGE_NAME)-$(PACKAGE_VERSION).tgz
PACKAGE_TGZ:=$(OUTPUT_ROOT)/$(PACKAGE_TGZ_NAME)

all:  $(OUTPUT_ROOT)/time.compiled

package: $(PACKAGE_TGZ)

install: $(xNPM_LOCKFILE)

lint:
	@echo Linting...

audit:
	@echo Auditing...

$(PACKAGE_TGZ): $(OUTPUT_ROOT)/time.compiled
	@echo Packaging...
	@(PACKAGE="$$($(REAL_NPM) pack $(REAL_NPM_FLAGS))" && \
      if [ "$${PACKAGE}" = "$(PACKAGE_TGZ_NAME)" ];\
      then mv $(PACKAGE_TGZ_NAME) $(OUTPUT_ROOT) ; \
      else echo Internal error expected $(PACKAGE_TGZ_NAME) but got $${PACKAGE} ; \
      fi)
	@(FOO="$@"; PREF="$$(pwd)"; BAR=$${FOO#$${PREF}}; echo Created .$${BAR} )

$(OUTPUT_ROOT)/time.compiled: $(xNPM_LOCKFILE) $(JS_SOURCES)
	@echo Compiling...
	@touch $@

$(xNPM_LOCKFILE): package.json
	@echo Installing dependencies...
	@$(xNPM) install $(xNPM_FLAGS)
	@touch $@

test:
	@$(xNPM) test

publish:
	$(REAL_NPM) login
	$(REAL_NPM) publish $(PACKAGE_TGZ)

clean:
	rm -rf build autom4te.cache

.PHONY: all package install audit
