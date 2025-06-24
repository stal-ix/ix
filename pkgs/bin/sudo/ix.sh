{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/sudo-project/sudo/archive/refs/tags/v1.9.17.tar.gz
466f15047151abd2f0d81da3c00765393a4839fd2c6f00e866d27e2252e5d30c
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block cpp_defines %}
_PATH_SUDO_LOGSRVD_PID=\\\"/var/run/sudo/sudo_logsrvd.pid\\\"
_PATH_MV=\\\"/bin/mv\\\"
_PATH_SUDO_TIMEDIR=\\\"/var/run/sudo/ts\\\"
{% endblock %}
