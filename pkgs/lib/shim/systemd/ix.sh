{% extends '//die/proxy.sh' %}

{% block install %}
mkdir -p ${out}/include/systemd
cat << EOF > ${out}/include/systemd/sd-login.h
#pragma once
#define sd_pid_get_session(...) -1
#define sd_session_get_type(...) -1
#define sd_uid_get_sessions(...) -1
#define sd_pid_get_user_unit(...) -1
EOF
{% endblock %}
