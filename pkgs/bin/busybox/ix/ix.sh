{% extends '//bin/busybox/t/ix.sh' %}

{% block patch %}
{{super()}}
sed -e 's|"syslogd"|"syslogd/syslogd"|' -i sysklogd/syslogd.c
{% endblock %}

{% block install1 %}
{{super()}}
{{hooks.wrap_sudo_binary('ping')}}
{{hooks.wrap_sudo_binary('ping6')}}
{% endblock %}
