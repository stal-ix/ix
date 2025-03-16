{% extends '//lib/gtk/source/view/4/t/ix.sh' %}

{% block meson_flags %}
{{super()}}
gir=true
vapi=true
{% endblock %}

{% block host_libs %}
{{super()}}
lib/gtk/source/view/4
lib/gtk/source/view/4/dl
{% endblock %}

{% block bld_libs %}
{{super()}}
lib/gi/repository
lib/shim/fake/pkg(pkg_name=vapigen,pkg_ver=100.500)
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
bld/gir
bin/vala
{{super()}}
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
