{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://sourceware.org/elfutils/ftp/0.185/elfutils-0.185.tar.bz2
# md5 2b6e94c2eebc1f2194173e31bca9396e
{% endblock %}

{% block deps %}
# lib lib/argp/standalone lib/fts lib/obstack
# lib lib/z lib/bzip2 lib/xz lib/zstd lib/iconv lib/intl
# bld dev/lang/m4 dev/build/make env/std
{% endblock %}

{% block cflags %}
export CPPFLAGS="-I${PWD} ${CPPFLAGS}"
export ac_cv_c99=yes
{% endblock %}

{% block patch %}
mkdir sys && echo > sys/cdefs.h

cat - lib/system.h << EOF > _ && mv _ lib/system.h
#include <err.h>
EOF

sed -e 's|#include <error.h>|#define error(status, errno, ...) err(status, __VA_ARGS__)|' -i lib/system.h
{% endblock %}

{% block coflags %}
--disable-libdebuginfod
--disable-debuginfod
{% endblock %}

{% block build %}
for l in backends lib libcpu libebl libdwelf libdwfl libelf libdw; do
    (cd ${l} && (make -j ${make_thrs} || (echo > libdw.so; echo > libelf.so)))
done
{% endblock %}

{% block install %}
for l in backends lib libcpu libebl libdwelf libdwfl libelf libdw; do
    (cd ${l} && make install)
done

cp version.h ${out}/include/elfutils/
{% endblock %}
