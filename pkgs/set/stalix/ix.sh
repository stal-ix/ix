{% extends '//die/hub.sh' %}

{% block run_deps %}
set/stalix/unwrap(curses=netbsd,intl_ver=no,purec=musl/unwrap,libc=musl/pure)
{% endblock %}
