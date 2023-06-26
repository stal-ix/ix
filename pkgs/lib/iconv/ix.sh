{% extends 't/ix.sh' %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block install %}
{{super()}}
rm ${out}/lib/libcharset.a
{% endblock %}

{% block patch %}
{{super()}}
# WASI fix
sed -e 's|.*cd src.*||' -i Makefile.in
{% endblock %}

{% block env %}
export COFLAGS="--with-libiconv-prefix=${out} --with-iconv=${out} \${COFLAGS}"
{% endblock %}
