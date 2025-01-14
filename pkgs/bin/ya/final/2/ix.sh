{% extends '//bin/ya/final/unwrap/ix.sh' %}

{% block ya_clang_wrapper %}
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/prepend
{% endblock %}

{% block ya_make_cmd %}
{{super()}}
--cxx-compiler $(command -v clang-18)
--c-compiler $(command -v clang-18)
-DCFLAGS="-isystem${CLANG_HEADERS}"
--host-platform-flag=CFLAGS="-isystem${CLANG_HEADERS}"
{% endblock %}

{% block ya_make_targets %}
contrib/tools/ragel6/ragel6
{% endblock %}
