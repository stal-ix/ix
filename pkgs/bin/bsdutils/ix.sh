{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/bsdutils/lite(curses=netbsd,purec=musl/unwrap,libc=musl/pure)
{% endblock %}
