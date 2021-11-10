{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://sourceware.org/elfutils/ftp/0.185/elfutils-0.185.tar.bz2
2b6e94c2eebc1f2194173e31bca9396e
{% endblock %}

{% block lib_deps %}
lib/argp/standalone/mix.sh
lib/fts/mix.sh
lib/obstack/mix.sh
lib/z/mix.sh
lib/bzip2/mix.sh
lib/xz/mix.sh
lib/zstd/mix.sh
lib/iconv/mix.sh
lib/intl/mix.sh
{% endblock %}

{% block bld_deps %}
dev/lang/m4/mix.sh
{{super()}}
{% endblock %}

{% block patch %}
mkdir sys

cat << EOF > sys/cdefs.h
EOF
{% endblock %}

{% block setup %}
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
