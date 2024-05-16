{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if clang_ver %}
bld/compiler/dispatch
{% else %}
bld/compiler/dispatch(clang_ver=18,std_env=bld/boot/9/clang/env)
{% endif %}
{% endblock %}
