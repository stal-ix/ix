{% extends '//die/vala/meson.sh' %}

{#
** (io.elementary.screenshot:9490): WARNING **: 23:45:33.213: Application.vala:117: Failed to take screenshot via portal: GDBus.Error:org.freedesktop.DBus.Error.UnknownInterface: Object does not implement the interface 'org.freedesktop.portal.Screenshot'
#}

{% block git_repo %}
https://github.com/elementary/screenshot
{% endblock %}

{% block git_commit %}
cdbd008944c2e29839fb99a60c82c6563ced7582
{% endblock %}

{% block git_sha %}
e3884a233b927489e7ec2d0f72c9d5fe23efc9df6150475a7778bf7f9f5664ed
{% endblock %}

{% block bld_libs %}
lib/c
lib/gee
lib/gtk
lib/glib
lib/portal
lib/granite
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}

{% block bld_data %}
{{super()}}
lib/gee/gir
lib/granite/{{gtk_ver}}/gir
lib/portal/gir(gtk_ver={{gtk_ver}})
{% endblock %}
