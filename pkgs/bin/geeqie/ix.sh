{% extends '//die/c/meson.sh' %}

{% block fetch %}
http://geeqie.org/cgi-bin/gitweb.cgi?p=geeqie.git;a=snapshot;h=fa7667fb6a2d59f4facb11c083c4d74d0d80f459;sf=tbz2
sha:261d4b90baa401f01b95b9d55564f542e215cc5c68e0cdee52ee29e62bc41b3a
{% endblock %}

{% block bld_libs %}
lib/c
lib/raw
lib/jxl
lib/heif
lib/gtk/3
lib/exiv2
lib/archive
{% endblock %}

{% block bld_tool %}
bld/glib
bld/gettext
{% endblock %}
