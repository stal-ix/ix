{% extends '//die/hub.sh' %}

{% block ind_deps %}
bin/clang/lib
{% endblock %}

{% block run_deps %}
{% if clang_ver %}
bld/compiler/unwrap
{% elif native %}
bld/compiler/unwrap(clang_ver={{default_clang}},std_env=bld/boot/10/clang/env)
{% else %}
bld/compiler/unwrap(clang_ver={{default_clang}})
{% endif %}
{% endblock %}
