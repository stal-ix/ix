{% extends '//bin/busybox/t/ix.sh' %}

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
{% endblock %}
