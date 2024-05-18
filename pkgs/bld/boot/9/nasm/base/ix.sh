{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/nasm(std_env=bld/boot/8/env/cxx,libc_lite=1)
{% endblock %}
