{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/clang/16(c_compiler=bin/clang/16/full,crt_ver=16,cplpl_std=16)
{% endblock %}
