{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
djvu
{% endblock %}

{% block version %}
3.5.29
{% endblock %}

{% block fetch %}
http://downloads.sourceforge.net/djvu/djvulibre-{{self.version().strip()}}.tar.gz
d3b4b03ae2bdca8516a36ef6eb27b777f0528c9eda26745d9962824a3fdfeccf
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/jpeg
{% endblock %}

{% block cxx_flags %}
{{super()}}
-Wno-register
{% endblock %}

{% block configure_flags %}
--disable-xmltools
--disable-desktopfiles
{% endblock %}

{% block make_flags %}
-C libdjvu
{% endblock %}

{% block install %}
{{super()}}
cp config.h libdjvu/*.h ${out}/include/libdjvu/
{% endblock %}
