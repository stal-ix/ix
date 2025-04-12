{% extends '//die/c/autohell.sh' %}

{% block version %}
1.0.6
{% endblock %}

{# hard X11 dep #}

{% block fetch %}
https://github.com/IgnorantGuru/spacefm/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:fedea9fcad776e0af4b8d90c5a1c86684a9c96ef1cdd4e959530ce93bdebe7c9
{% endblock %}

{% block bld_libs %}
lib/c
lib/dbus
lib/udev
lib/glib
lib/gtk/3
lib/shim/x11
{% endblock %}

{% block bld_tool %}
bld/gettext
bld/intltool
{% endblock %}

{% block configure_flags %}
--disable-video-thumbnails
--disable-desktop-integration
{% endblock %}

{% block shell %}
bin/bash/lite/sh
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
