{% extends 't/ix.sh' %}

{% block cmake_flags %}
WITH_EXAMPLES=OFF
{{super()}}
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|.*Libs.*stdc.*||' -i ${out}/lib/pkgconfig/libheif.pc
{% endblock %}
