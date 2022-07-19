{% extends 't/ix.sh' %}

{% block cmake_flags %}
EXPAT_BUILD_TOOLS=OFF
{{super()}}
{% endblock %}

{% block env %}
export COFLAGS="--with-expat=${out} --with-libexpat-prefix=${out} --with-libexpat=${out} --with-system-expat=yes \${COFLAGS}"
{% endblock %}
