{% extends '//lib/curl/lite/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/wolfssl
{% endblock %}
