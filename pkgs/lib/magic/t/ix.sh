{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
file
{% endblock %}

{% block version %}
5.46
{% endblock %}

{% block fetch %}
https://astron.com/pub/file/file-{{self.version().strip()}}.tar.gz
c9cc77c7c560c543135edc555af609d5619dbef011997e988ce40a3d75d86088
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
