{% extends '//lib/mesa/llvm/ix.sh' %}

{% block bld_tool %}
{{super()}}
pip/ply
bin/intel/clc
{% endblock %}

{% block meson_flags %}
{{super()}}
intel-clc=system
{% endblock %}
