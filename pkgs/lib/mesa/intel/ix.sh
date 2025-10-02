{% extends '//lib/mesa/llvm/ix.sh' %}

{% block bld_tool %}
{{super()}}
pip/ply
lib/mesa/intel/clc/{{clang_ver or default_clang}}
{% endblock %}

{% block meson_flags %}
{{super()}}
mesa-clc=system
{% endblock %}
