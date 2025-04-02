{% extends '//die/hub.sh' %}

{% block run_deps %}
set/stalix/unwrap(curses=netbsd,intl_ver=no,libc_lite=1)
{% endblock %}
