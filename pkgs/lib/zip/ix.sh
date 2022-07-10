{% extends '//lib/zip/t/ix.sh' %}

{% block install %}
{{super()}}
sed -e 's|.*bin.*||' -i ${out}/lib/pkgconfig/libzip.pc
sed -e 's|BZip2::BZip2|c|g' \
    -e 's|OpenSSL::Crypto|c|g' \
    -i ${out}/lib/cmake/libzip/libzip-targets.cmake
{% endblock %}

{% block cmake_flags %}
{{super()}}
BUILD_TOOLS=OFF
BUILD_REGRESS=OFF
BUILD_EXAMPLES=OFF
{% endblock %}
