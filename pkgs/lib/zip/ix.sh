{% extends '//lib/zip/t/ix.sh' %}

{% block install %}
{{super()}}
sed -e 's|.*bin.*||' -i ${out}/lib/pkgconfig/libzip.pc
{% endblock %}

{% block cmake_flags %}
{{super()}}
BUILD_TOOLS=OFF
BUILD_REGRESS=OFF
BUILD_EXAMPLES=OFF
{% endblock %}
