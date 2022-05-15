{% extends '//mix/autohell.sh' %}

{% block fetch %}
{% include '//bin/binutils/ver.sh' %}
{% endblock %}

{% block unpack %}
{{super()}}
cd gold
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/c++
lib/iberty
{% endblock %}

{% block configure_flags %}
--enable-gold=yes
--enable-plugins=no
--enable-werror=no
--with-system-zlib
{% endblock %}

{% block patch %}
cat << EOF > ../bfd/bfdver.h
#define BFD_VERSION_STRING ""
#define REPORT_BUGS_TO ""
EOF
{% endblock %}

{% block make_flags %}
LIBIBERTY=
{% endblock %}

{% block install %}
{{super()}}
rm -rf ${out}/*-*
{% endblock %}
