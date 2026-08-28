{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
file
{% endblock %}

{% block version %}
5.48
{% endblock %}

{% block fetch %}
https://astron.com/pub/file/file-{{self.version().strip()}}.tar.gz
ed14656883b23a364b4057c05595d93252da9bc473d30106519519d0da141283
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block configure_flags %}
--disable-elf
--disable-elf-core
--disable-zlib
--disable-bzlib
--disable-xzlib
--disable-zstdlib
--disable-lzlib
--disable-lrziplib
--disable-libseccomp
{% endblock %}
