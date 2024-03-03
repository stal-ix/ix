{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://git.pwmt.org/pwmt/girara/-/archive/0.4.3/girara-0.4.3.tar.bz2
sha:b53c2d6a96f9482252fc26844762d08c975b9677f0a33b2d584081d318800530
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/gtk/3
lib/json/glib
{% endblock %}

{% block bld_tool %}
bld/glib
bld/gettext
{% endblock %}
