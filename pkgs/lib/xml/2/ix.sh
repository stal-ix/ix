{% extends 't/ix.sh' %}

{% block env %}
export COFLAGS="--with-libxml2-prefix=${out} \${COFLAGS}"
export CPPFLAGS="-I${out}/include/libxml2 \${CPPFLAGS}"
{% endblock %}
