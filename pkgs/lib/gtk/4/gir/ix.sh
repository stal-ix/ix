{% extends '//lib/gtk/4/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/gi/repository
{% endblock %}

{% block host_libs %}
{{super()}}
lib/gtk/4/dl/dl
{% endblock %}

{% block bld_data %}
lib/glib/gir
lib/pango/gir
lib/graphene/gir
lib/harfbuzz/gir
lib/gdk/pixbuf/gir
lib/gi/repository/gir
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/gir
{% endblock %}

{% block meson_flags %}
{{super()}}
introspection=enabled
{% endblock %}

{% block postinstall %}
mv ${out}/lib/gi* ${out}/share/
rm -rf ${out}/bin ${out}/lib ${out}/include
{% endblock %}

{% block env %}
export GIRPATH="${out}/share/gir-1.0:\${GIRPATH}"
export VALAFLAGS="--girdir=${out}/share/gir-1.0 \${VALAFLAGS}"
export GIRSFLAGS="--add-include-path=${out}/share/gir-1.0 \${GIRSFLAGS}"
export GIRCFLAGS="--includedir=${out}/share/gir-1.0 \${GIRCFLAGS}"
{% endblock %}
