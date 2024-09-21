{% extends '//die/hub.sh' %}

{% block ind_deps %}
bin/clang/lib
{% endblock %}

{% block run_deps %}
{% if clang_ver %}
bld/compiler/unwrap
{% else %}
bld/compiler/unwrap(clang_ver=19,std_env=bld/boot/9/clang/env)
{% endif %}
{% endblock %}
