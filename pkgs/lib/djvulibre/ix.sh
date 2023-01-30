{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
http://downloads.sourceforge.net/djvu/djvulibre-3.5.28.tar.gz
sha:fcd009ea7654fde5a83600eb80757bd3a76998e47d13c66b54c8db849f8f2edc
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/tiff
lib/jpeg
{% endblock %}

{% block setup %}
export CFLAGS="-Wno-register ${CFLAGS}"
{% endblock %}
