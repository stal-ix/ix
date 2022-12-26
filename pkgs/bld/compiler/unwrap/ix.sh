{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/clang/{{clang_ver or '15'}}(std_env=bld/boot/8/env/cxx)
{% endblock %}
