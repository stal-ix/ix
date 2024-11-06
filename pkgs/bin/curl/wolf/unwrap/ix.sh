{% extends '//lib/curl/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/wolfssl
{% endblock %}
