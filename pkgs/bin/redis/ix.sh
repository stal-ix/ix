{% extends 't/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/openssl
lib/execinfo
{% endblock %}

{% block make_flags %}
{{super()}}
USE_BACKTRACE=yes
USE_OPENSSL=yes
BUILD_TLS=yes
{% endblock %}
