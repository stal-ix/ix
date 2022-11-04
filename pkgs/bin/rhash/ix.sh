{% extends '//lib/rhash/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/openssl
{% endblock %}
