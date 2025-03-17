{% extends '//lib/pango/t/ix.sh' %}

{% block meson_flags %}
{{super()}}
introspection=enabled
{% endblock %}

{% block host_libs %}
{{super()}}
lib/pango/dl
{% endblock %}

{% block bld_libs %}
{{super()}}
lib/glib
lib/gi/repository
{% endblock %}

{% block bld_data %}
lib/glib/gir
lib/harfbuzz/gir
lib/gi/repository/gir
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/gir
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/lib/gi* ${out}/share/
{% endblock %}

{% block env %}
export GIRPATH="${out}/share/gir-1.0:\${GIRPATH}"
export VALAFLAGS="--girdir=${out}/share/gir-1.0 \${VALAFLAGS}"
export GIRSFLAGS="--add-include-path=${out}/share/gir-1.0 \${GIRSFLAGS}"
export GIRCFLAGS="--includedir=${out}/share/gir-1.0 \${GIRCFLAGS}"
{% endblock %}
