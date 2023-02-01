{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if clang_ver %}
bin/clang/{{clang_ver}}(clang_ver=)
{% else %}
bin/clang/16(std_env=bld/boot/8/env/cxx)
{% endif %}
{% endblock %}
