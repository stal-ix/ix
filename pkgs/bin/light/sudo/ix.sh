{% extends '//die/proxy.sh' %}

{% block install %}
{{hooks.wrap_sudo_binary('light')}}
{% endblock %}
