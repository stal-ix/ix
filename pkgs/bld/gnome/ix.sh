{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/glib
bld/gettext
bld/gnome/scripts
bld/fake(tool_name=gtk-update-icon-cache)
bld/fake(tool_name=gtk4-update-icon-cache)
bld/fake(tool_name=update-desktop-database)
{% endblock %}
