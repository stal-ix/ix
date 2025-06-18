{% extends '//lib/mesa/llvm/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/clc
lib/spirv/llvm/translator
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/rust/86
bin/cbindgen
bin/llvm/spirv
bin/rust/bindgen
{% endblock %}

{% block step_setup %}
{{super()}}
cat << EOF >> ${tmp}/cross.ini
[binaries]
rust = 'rustc'
EOF
{% endblock %}
