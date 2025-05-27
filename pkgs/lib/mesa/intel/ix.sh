{% extends '//lib/mesa/llvm/ix.sh' %}

{% block bld_tool %}
{{super()}}
pip/ply
bin/intel/clc/{{clang_ver or default_clang}}
{% endblock %}

{% block meson_flags %}
{{super()}}
mesa-clc=system
intel-clc=system
{% endblock %}
