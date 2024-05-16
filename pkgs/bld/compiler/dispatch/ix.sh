{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/clang/{{clang_ver}}(clang_ver=,libcplpl_ver={{clang_ver}},crt_ver={{clang_ver}})
{% endblock %}
