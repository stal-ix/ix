{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
librevenge
{% endblock %}

{% block version %}
0.0.5
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/libwpd/librevenge/librevenge-{{self.version().strip()}}/librevenge-{{self.version().strip()}}.tar.xz
sha:106d0c44bb6408b1348b9e0465666fa83b816177665a22cd017e886c1aaeeb34
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
lib/boost
{% endblock %}

{% block configure_flags %}
--disable-werror
--disable-tests
{% endblock %}
