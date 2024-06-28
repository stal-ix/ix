{% extends '//lib/drm/t/ix.sh' %}

{% block bld_libs %}
lib/cairo
{{super()}}
{% endblock %}

{% block meson_flags %}
{{super()}}
tests=true
cairo-tests=enabled
install-test-programs=true
{% endblock %}

{% block meson_strip_dirs %}
{% endblock %}
