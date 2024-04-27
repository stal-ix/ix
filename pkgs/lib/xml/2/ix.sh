{% extends 't/ix.sh' %}

{% block cpp_defines %}
{{super()}}
LIBXML_STATIC=1
{% endblock %}

{% block env %}
export COFLAGS="--with-libxml2-prefix=${out} \${COFLAGS}"
export CPPFLAGS="-DLIBXML_STATIC=1 -I${out}/include/libxml2 \${CPPFLAGS}"
{% endblock %}
