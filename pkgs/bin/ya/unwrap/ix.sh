{% extends '//bin/ya/t/ix.sh' %}

{% block bld_tool %}
bin/ya/bootstrap
{{super()}}
{% endblock %}

{% block ya_make_options %}{{super()}} -k{% endblock %}

{% block ya_make_flags %}
{{super()}}
AR=${YA_CLANG_DIR}/bin/llvm-ar
{% endblock %}

{% block patch %}
base64 -d << EOF | patch -p1
{% include 'clang23.patch/base64' %}
EOF
{% endblock %}

{% block ya_make_targets %}
devtools/local_cache/toolscache/server/ya-tc
devtools/ya/bin/ya-bin
devtools/ya/test/programs/test_tool/bin/test_tool
devtools/yexport/bin/yexport
devtools/ymake/bin/ymake
{% endblock %}
