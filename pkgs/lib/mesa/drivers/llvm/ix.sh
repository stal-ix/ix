{% extends '//lib/mesa/drivers/valve/ix.sh' %}

{% block lib_deps %}
{{super()}}
lib/llvm/15
{% endblock %}

{% block meson_flags %}
{{super()}}
llvm=enabled
shared-llvm=disabled
{% endblock %}

{% block meson_cross %}
{% endblock %}
