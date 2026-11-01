{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
Minder
{% endblock %}

{% block version %}
2.0.9
{% endblock %}

{% block fetch %}
https://github.com/phase1geo/Minder/archive/refs/tags/{{self.version().strip()}}.tar.gz
20443dacbcf13d04640fcbd170286ff1294f308984008e8633872c2cf5ac7c5e
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk
lib/gee
lib/webp
lib/xml/2
lib/cairo
lib/granite
lib/archive
lib/discount
lib/shim/fake/pkg(pkg_name=libmarkdown,pkg_ver=3.0.2.0)
lib/gtk/deps
lib/json/glib
lib/gtk/source/view
{% if gtk_ver == '3' %}
lib/handy
lib/gtk/source/view/4/ctor
{% endif %}
{% endblock %}

{% block bld_tool %}
bld/gir
bld/glib
bin/vala
bld/gnome
bld/gettext
{% endblock %}

{% block bld_data %}
lib/gee/gir
lib/glib/gir
{% if gtk_ver == '3' %}
lib/handy/gir
{% endif %}
lib/granite/{{gtk_ver}}/gir
lib/gtk/source/view/{{1 + gtk_ver | int}}/gir
lib/gi/repository/gir
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/bin/com* ${out}/bin/minder
{% endblock %}
