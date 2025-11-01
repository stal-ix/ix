{% extends '//lib/ng/tcp2/t/ix.sh' %}

{% block lib_deps %}
{{super()}}
lib/wolfssl
{% endblock %}

{% block cmake_flags %}
{{super()}}
ENABLE_WOLFSSL=ON
ENABLE_OPENSSL=OFF
{% endblock %}
