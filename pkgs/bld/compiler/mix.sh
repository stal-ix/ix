{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/clang/14(std_env=bld/boot/8/env/cxx,opt=fast)
{% endblock %}
