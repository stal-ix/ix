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
cd ${out}/bin
for x in ping ping6; do
    rm ${x}
    cat << EOF > ${x}
#!/usr/bin/env sh
exec sudo ${PWD}/busybox ${x} "\${@}"
EOF
    chmod +x ${x}
done
rm reboot halt
{% endblock %}
