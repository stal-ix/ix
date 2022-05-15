{% extends '//mix/autohell.sh' %}

{% block fetch %}
{% include '//bin/binutils/t/ver.sh' %}
{% endblock %}

{% block unpack %}
{{super()}}
cd libctf
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/texinfo
{% endblock %}

{% block lib_deps %}
lib/c
lib/bfd
{% endblock %}

{% block configure_flags %}
--enable-targets=all
{% endblock %}

{% block patch %}
sed -e 's|../bfd/libbfd.la||g' -i Makefile.in
sed -e 's|\\${SHELL}|sh|' -i configure
{% endblock %}
