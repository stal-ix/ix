{% extends '//lib/ng/tcp2/t/ix.sh' %}

{% block lib_deps %}
{{super()}}
lib/openssl
{% endblock %}

{% block cmake_flags %}
{{super()}}
ENABLE_BORINGSSL=ON
ENABLE_OPENSSL=OFF
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|ENABLE_STATIC_LIB|ENABLE_SHARED_LIB|' \
    -i crypto/boringssl/CMakeLists.txt
{% endblock %}
