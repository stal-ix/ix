{% extends '//die/c/meson.sh' %}

{% block lib_deps %}
lib/c
lib/glib
lib/cairo
lib/girara
{% endblock %}

{% block bld_libs %}
bin/zathura/headers
{% endblock %}

{% block bld_tool %}
bld/librarian
{% endblock %}

{% block meson_flags %}
plugindir=${out}/mod
{% endblock %}

{% block install %}
{{super()}}
patchns ${out}/mod/*.a {{self.plugin().strip()}}_
rm -r ${out}/share
{% endblock %}

{% block env %}
export {{uniq_id}}=${out}
{% endblock %}
