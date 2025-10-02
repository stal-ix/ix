{% extends '//lib/mesa/valve/ix.sh' %}

{% block lib_deps %}
{{super()}}
lib/llvm
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/python
bld/llvm/config
{% endblock %}

{% block meson_flags %}
{{super()}}
amd-use-llvm=true
llvm=enabled
shared-llvm=disabled
{% endblock %}

{% block meson_cross %}
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|config-tool|auto|' \
    -e 's|_llvm_rtti = .*|_llvm_rtti = true|' \
    -i meson.build
{% endblock %}
