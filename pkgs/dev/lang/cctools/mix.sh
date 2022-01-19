{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/tpoechtrager/cctools-port/archive/236a426c1205a3bfcf0dbb2e2faf2296f0a100e5.zip
3ba3b9f5e6ebc2afe77cdafeaaeeb981
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/objc
{% if target.os == 'linux' %}
lib/bsd/overlay
{% endif %}
{% endblock %}

{% block bld_tool %}
lib/magic
bin/auto/conf/2/69
bin/auto/make/1/16
{% endblock %}

{% block std_box %}
bin/bootbox
{% endblock %}

{% block unpack %}
{{super()}}
cd cctools
{% endblock %}

{% block patch_configure %}
{{super()}}
sed -e 's/__arm__/__eat_shit__/' -i configure
{% endblock %}

{% block c_rename_symbol %}
__crashreporter_info__
reallocf
{% endblock %}

{% block setup %}
export CPPFLAGS="-iquote ${PWD}/ld64/src/3rd ${CPPFLAGS}"
{% endblock %}

{% block patch %}
cat << EOF > libobjc2/Makefile.am
noinst_LTLIBRARIES = libobjc.la
libobjc_la_LDFLAGS =
libobjc_la_SOURCES =
EOF

cat << EOF > ld64/src/3rd/BlocksRuntime/Makefile.am
noinst_LTLIBRARIES = libBlocksRuntime.la
noinst_HEADERS =
libBlocksRuntime_la_SOURCES =
EOF
{% endblock %}

{% block configure_flags %}
{% if target.os == 'darwin' %}
--with-sysroot=${OSX_SDK}
{% endif %}
{% endblock %}
