{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/clang/17(c_compiler=bin/clang/17/full,crt_ver=17,libcplpl_ver=17)
{% endblock %}
