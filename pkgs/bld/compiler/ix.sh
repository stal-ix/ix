{% extends '//die/hub.sh' %}

{% block ind_deps %}
bin/clang/lib
{% endblock %}

{% block run_deps %}
bin/clang/{{clang_ver or '15'}}(std_env=bld/boot/8/env/cxx)
{% endblock %}
