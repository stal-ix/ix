{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://download.videolan.org/pub/videolan/libbluray/1.3.4/libbluray-1.3.4.tar.bz2
sha:478ffd68a0f5dde8ef6ca989b7f035b5a0a22c599142e5cd3ff7b03bbebe5f2b
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
