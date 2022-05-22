{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/clang(std_env=bld/boot/8/env/cxx,opt=fast)
{% endblock %}
