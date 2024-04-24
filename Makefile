include config.mk

# do NOT quote this
SAD_SCRIPTS=dsad sad-add sad-add-playlist sad-cmd sad-menu sad-start sad-toggle-play

PROJECTNAME=sad-scripts
all:
	@echo Nothing to build: use make install, make uninstall, or make dist.

dist:
	@echo creating dist tarball
	@mkdir -p ${PROJECTNAME}-${VERSION}
	@cp -R Makefile config.mk ${SAD_SCRIPTS} ${PROJECTNAME}-${VERSION}
	@tar -cf ${PROJECTNAME}-${VERSION}.tar ${PROJECTNAME}-${VERSION}
	@gzip ${PROJECTNAME}-${VERSION}.tar
	@rm -rf ${PROJECTNAME}-${VERSION}

install:
	@chmod 755 ${SAD_SCRIPTS}
	@echo installing scripts to ${DESTDIR}${PREFIX}/bin
	@mkdir -p ${DESTDIR}${PREFIX}
	@cp bm ${DESTDIR}${PREFIX}/bin

uninstall:
	@echo removing scripts
	rm -f ${DESTDIR}${PREFIX}/bin/bm

distclean:
	@rm -r  ${PROJECTNAME}-${VERSION}
