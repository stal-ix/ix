{% extends '//die/c/meson.sh' %}

{% block fetch %}
http://geeqie.org/cgi-bin/gitweb.cgi?p=geeqie.git;a=snapshot;h=f8c3ab333e95d45d4e68007256362dbdbdb3de3a;sf=tbz2
sha:41bb7d3177982aeeec0e92f1d969e601042b2e6855db25c6bdd83dd68d503994
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

{% block cpp_missing %}
locale.h
{% endblock %}
