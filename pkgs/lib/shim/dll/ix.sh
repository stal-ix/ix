{% extends '//die/proxy.sh' %}

{% block env %}
export LDFLAGS="-l{{dll_name}} \${LDFLAGS}"
{% endblock %}
