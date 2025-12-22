{% extends '//bin/evince/3/t/ix.sh' %}

{% block lib_deps %}
lib/c
lib/z
lib/t1
lib/intl
lib/dbus
lib/glib
lib/xml/2
lib/gtk/3
lib/handy
lib/secret
lib/spectre
lib/archive
lib/poppler
lib/djvulibre
lib/gsettings/desktop/schemas
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/librarian
{% endblock %}

{% block install %}
cp -R ${tmp}/lib ${out}/
rm ${out}/lib/libevdocument3.a
rm ${out}/lib/libevview3.a
{% for m in self.modules() | parse_list %}
patchns ${out}/lib/lib{{m}}document.a {{m}}_
{% endfor %}
{% endblock %}
