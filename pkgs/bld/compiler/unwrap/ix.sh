{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/clang/{{clang_ver or '16'}}(std_env=bld/boot/8/env/cxx)
{% endblock %}
