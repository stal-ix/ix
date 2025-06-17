{% extends '//bin/busybox/t/ix.sh' %}

{% block kconfig_flags %}
{{super()}}
CONFIG_SHA1_HWACCEL=n
CONFIG_SHA256_HWACCEL=n
CONFIG_TC=n
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|.*pidfile.*"syslogd".*||' -i sysklogd/syslogd.c
sed -e 's|exec_login_shell|exec_login_shell_impl|' \
    -i libbb/run_shell.c
cat << EOF >> libbb/run_shell.c
void FAST_FUNC exec_login_shell(const char* shell) {
    const char* ls = getenv("LOGIN_SCRIPT");
    if (!ls) {
        ls = shell;
    }
    exec_shell(ls, 1, NULL);
}
EOF
{% endblock %}

{% block install %}
{{super()}}
rm ${out}/bin/reboot ${out}/bin/halt ${out}/bin/timeout
{% endblock %}
