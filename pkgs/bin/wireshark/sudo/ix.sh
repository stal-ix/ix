{% extends '//die/proxy.sh' %}

{% block install %}
{{hooks.wrap_sudo_binary('tshark')}}
{{hooks.wrap_sudo_binary('dumpcap')}}
{% endblock %}
