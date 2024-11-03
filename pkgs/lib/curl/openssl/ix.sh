{% extends '//lib/curl/t/ix.sh' %}

{% block lib_deps %}
{{super()}}
lib/openssl
lib/ng/http/3
{% endblock %}
