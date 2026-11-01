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
llvm=enabled
amd-use-llvm=true
shared-llvm=disabled
{% endblock %}

{% block meson_cross %}
{% endblock %}

{% block patch %}
{{super()}}
patch -p1 <<'EOF'
{% include 'llvm-23.patch' %}
EOF
sed -e 's|config-tool|auto|' \
    -e 's|_llvm_rtti = .*|_llvm_rtti = true|' \
    -i meson.build
{% endblock %}
