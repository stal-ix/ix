{% extends '//die/hub.sh' %}

{% block run_deps %}
set/system/0/unwrap(curses=netbsd,intl_ver=no,purec=musl/unwrap,libc=musl/pure)
{% endblock %}
