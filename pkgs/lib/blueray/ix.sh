{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libbluray
{% endblock %}

{% block version %}
1.3.4
{% endblock %}

{% block fetch %}
https://download.videolan.org/pub/videolan/libbluray/{{self.version().strip()}}/libbluray-{{self.version().strip()}}.tar.bz2
478ffd68a0f5dde8ef6ca989b7f035b5a0a22c599142e5cd3ff7b03bbebe5f2b
{% endblock %}

{% block lib_deps %}
lib/c
lib/xml/2
lib/freetype
{% endblock %}

{% block configure_flags %}
--disable-bdjava-jar
--without-fontconfig
{% endblock %}

{% block c_rename_symbol %}
gc_free
{% endblock %}
