{% extends '//bin/busybox/t/ix.sh' %}

{% block kconfig_flags %}
{{super()}}
CONFIG_SHA1_HWACCEL=n
CONFIG_SHA256_HWACCEL=n
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|"syslogd"|"syslogd/syslogd"|' -i sysklogd/syslogd.c
{% endblock %}

{% block install %}
{{super()}}
rm ${out}/bin/reboot ${out}/bin/halt
{% endblock %}
