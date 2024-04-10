{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/hughsie/libxmlb/archive/refs/tags/0.3.18.tar.gz
sha:3798be088653a939b8516900eb5bd9491eda8975c5b9886434c670fa79cc56aa
{% endblock %}

{% block lib_deps %}
lib/c
lib/xz
lib/zstd
lib/glib
lib/stemmer
{% endblock %}

{% block meson_flags %}
gtkdoc=false
introspection=false
tests=false
{% endblock %}
