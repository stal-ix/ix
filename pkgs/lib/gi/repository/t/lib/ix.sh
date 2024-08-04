{% extends '//lib/gi/repository/t/ix.sh' %}

{% block host_libs %}
{{super()}}
lib/glib/dl
lib/gi/repository/bootstrap/dl
lib/gi/repository/bootstrap/shim
{% endblock %}

{% block bld_tool %}
bld/gir
{{super()}}
{% endblock %}

{% block meson_flags %}
{{super()}}
gi_cross_use_prebuilt_gi=true
{% endblock %}
