{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
djvu
{% endblock %}

{% block version %}
3.5.28
{% endblock %}

{% block fetch %}
http://downloads.sourceforge.net/djvu/djvulibre-{{self.version().strip()}}.tar.gz
fcd009ea7654fde5a83600eb80757bd3a76998e47d13c66b54c8db849f8f2edc
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/tiff
lib/jpeg
{% endblock %}

{% block bld_tool %}
bin/gzip
{% endblock %}

{% block cxx_flags %}
{{super()}}
-Wno-register
{% endblock %}
