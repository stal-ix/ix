{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://sourceware.org/elfutils/ftp/0.185/elfutils-0.185.tar.bz2
# md5 2b6e94c2eebc1f2194173e31bca9396e
{% endblock %}

{% block deps %}
# lib lib/argp/standalone/package.sh
# lib lib/fts/package.sh
# lib lib/obstack/package.sh
# lib lib/z/package.sh
# lib lib/bzip2/package.sh
# lib lib/xz/package.sh
# lib lib/zstd/package.sh
# lib lib/iconv/package.sh
# lib lib/intl/package.sh
# bld dev/lang/m4/package.sh
# bld dev/build/make/package.sh
# bld env/std/package.sh
{% endblock %}

{% block cflags %}
export CPPFLAGS="-I${PWD} ${CPPFLAGS}"
export ac_cv_c99=yes
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
