{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://sourceware.org/elfutils/ftp/0.186/elfutils-0.186.tar.bz2
2c095e31e35d6be7b3718477b6d52702
{% endblock %}

{% block lib_deps %}
lib/fts/mix.sh
lib/obstack/mix.sh
lib/z/mix.sh
lib/bzip2/mix.sh
lib/xz/mix.sh
lib/zstd/mix.sh
lib/intl/mix.sh
{% endblock %}

{% block bld_libs %}
lib/argp/standalone/mix.sh
{% endblock %}

{% block bld_tool %}
dev/lang/m4/mix.sh
{% endblock %}

{% block patch %}
mkdir sys && echo > sys/cdefs.h
{% endblock %}

{% block setup %}
export CPPFLAGS="-I${PWD} ${CPPFLAGS}"
{% endblock %}

{% block configure_flags %}
--disable-libdebuginfod
--disable-debuginfod
{% endblock %}

{% block build %}
make -C libdw libdw.a
make -C libelf libelf.a
{% endblock %}

{% block install %}
make -C libdw install-exec install-data
make -C libelf install-exec install-data
cp version.h ${out}/include/elfutils/
{% endblock %}
