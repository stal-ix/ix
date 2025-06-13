{% extends '//die/c/meson.sh' %}

{% block fetch %}
http://geeqie.org/cgi-bin/gitweb.cgi?p=geeqie.git;a=snapshot;h=24407f761ea43dbe22436f8dd197df482a907af6;sf=tgz
392d9642946045bfd8178d80ec9951d5a4cedb28350902d9893f22c6fff68f39
{% endblock %}

{% block bld_libs %}
lib/c
lib/raw
lib/jxl
lib/heif
lib/gtk/3
lib/exiv2
lib/kernel
lib/archive
{% endblock %}

{% block bld_tool %}
bld/glib
bld/gettext
{% endblock %}

{% block cpp_missing %}
locale.h
{% endblock %}
