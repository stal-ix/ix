{% extends '//lib/ng/tcp2/t/ix.sh' %}

{% block lib_deps %}
{{super()}}
lib/openssl
{% endblock %}

{% block cmake_flags %}
{{super()}}
ENABLE_OPENSSL=ON
{% endblock %}
