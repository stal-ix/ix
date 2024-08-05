{% extends '//die/proxy.sh' %}

{% block install %}
mkdir -p ${out}/include/systemd
cat << EOF > ${out}/include/systemd/sd-login.h
#pragma once
#define sd_pid_get_session(...) -1
#define sd_session_get_type(...) -1
#define sd_uid_get_sessions(...) -1
#define sd_pid_get_user_unit(...) -1
#define sd_session_is_active(...) 0
#define sd_uid_get_display(...) -1
#define sd_session_get_class(...) -1
#define sd_session_get_state(...) -1
#define sd_session_get_seat(A, B) (*B = strdup("2"), 0)
EOF
{% endblock %}
