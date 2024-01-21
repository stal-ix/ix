{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/nasm(std_env=bld/boot/7/env/cxx)
{% endblock %}
