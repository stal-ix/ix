{% extends 't/ix.sh' %}

{% block cmake_flags %}
{{super()}}
EXIV2_BUILD_EXIV2_COMMAND=OFF
{% endblock %}

{% block install %}
{{super()}}
cat << EOF >> ${out}/include/exiv2/config.h
#include <__memory/auto_ptr.h>
EOF
{% endblock %}
