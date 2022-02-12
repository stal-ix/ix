{% extends '//mix/meson.sh' %}

{% block fetch %}
https://download.gnome.org/sources/libsoup/2.74/libsoup-2.74.2.tar.xz
sha:f0a427656e5fe19e1df71c107e88dfa1b2e673c25c547b7823b6018b40d01159
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/psl
lib/xml2
lib/glib
lib/brotli
lib/sqlite3
{% endblock %}

{% block bld_tool %}
lib/glib
{% endblock %}

{% block meson_flags %}
gnome=false
tls_check=false
{% endblock %}
