{% extends '//lib/curl/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/ng/tcp2/openssl
{% endblock %}
