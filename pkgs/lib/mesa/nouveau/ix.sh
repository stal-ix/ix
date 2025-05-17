{% extends '//lib/mesa/llvm/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/clc
lib/vulkan/spirv/llvm/translator
{% endblock %}

{% block bld_tool %}
{{super()}}
bin/cbindgen
bin/llvm/spirv
bin/rust/bindgen
bld/rust(rustc_ver=86)
{% endblock %}

{% block step_setup %}
{{super()}}
cat << EOF >> ${tmp}/cross.ini
[binaries]
rust = 'rustc'
EOF
{% endblock %}
