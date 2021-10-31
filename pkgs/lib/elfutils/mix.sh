{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://sourceware.org/elfutils/ftp/0.185/elfutils-0.185.tar.bz2
# md5 2b6e94c2eebc1f2194173e31bca9396e
{% endblock %}

{% block deps %}
# lib lib/argp/standalone/mix.sh
# lib lib/fts/mix.sh
# lib lib/obstack/mix.sh
# lib lib/z/mix.sh
# lib lib/bzip2/mix.sh
# lib lib/xz/mix.sh
# lib lib/zstd/mix.sh
# lib lib/iconv/mix.sh
# lib lib/intl/mix.sh
# bld dev/lang/m4/mix.sh
# bld dev/build/make/mix.sh
# bld env/std/mix.sh
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
