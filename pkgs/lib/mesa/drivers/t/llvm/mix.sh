{% extends '//lib/mesa/drivers/t/valve/mix.sh' %}

{% block lib_deps %}
{{super()}}
lib/llvm/13
{% endblock %}

{% block meson_flags %}
{{super()}}
llvm=enabled
shared-llvm=disabled
{% endblock %}
