{% extends '//lib/skia/t/ix.sh' %}

{% block lib_deps %}
{{super()}}
lib/opengl
{% endblock %}

{% block gn_args %}
{{super()}}
skia_use_egl=true
{% endblock %}
