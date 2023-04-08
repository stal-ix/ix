{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/clang/16(c_compiler=bin/clang/16/full,crt_ver=16,libcplpl_ver=16)
{% endblock %}
