install_static:
	install -D -m664 ${LIBUCONTEXT_STATIC_NAME} ${DESTDIR}${LIBUCONTEXT_STATIC_PATH}
	for i in ${LIBUCONTEXT_HEADERS}; do \
		destfn=$$(echo $$i | sed s:include/::g); \
		install -D -m644 $$i ${DESTDIR}${INCLUDEDIR}/$$destfn; \
	done
	install -D -m644 ${LIBUCONTEXT_PC} ${DESTDIR}${PKGCONFIGDIR}/${LIBUCONTEXT_PC}
