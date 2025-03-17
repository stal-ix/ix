{% extends '//lib/gtk/layer/shell/3/t/ix.sh' %}

{% block meson_flags %}
{{super()}}
introspection=true
{% endblock %}

{% block host_libs %}
{{super()}}
lib/gtk/layer/shell/3
{% endblock %}

{% block bld_libs %}
{{super()}}
lib/gi/repository
{% endblock %}

{% block bld_data %}
lib/glib/gir
lib/pango/gir
lib/gtk/3/gir
lib/harfbuzz/gir
lib/gdk/pixbuf/gir
lib/gi/repository/gir
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/gir
bin/vala
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/lib/gi* ${out}/share/
{% endblock %}

{% block env %}
export GIRPATH="${out}/share/gir-1.0:\${GIRPATH}"
export VALAFLAGS="--girdir=${out}/share/gir-1.0 --vapidir=${out}/share/vala/vapi \${VALAFLAGS}"
export GIRSFLAGS="--add-include-path=${out}/share/gir-1.0 \${GIRSFLAGS}"
export GIRCFLAGS="--includedir=${out}/share/gir-1.0 \${GIRCFLAGS}"
{% endblock %}
