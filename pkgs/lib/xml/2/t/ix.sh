{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libxml2
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libxml2/-/archive/v{{self.version().strip()}}/libxml2-v{{self.version().strip()}}.tar.bz2
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/iconv
{% endblock %}

{% block configure_flags %}
--with-ftp=off
--with-http=no
--with-modules=off
--disable-python
--without-python
--with-legacy
--with-sax1
{% endblock %}

{% block cpp_defines %}
LIBXML_STATIC=1
{% endblock %}

{% block env %}
{% if lib %}
export COFLAGS="--with-libxml2-prefix=${out} \${COFLAGS}"
export CPPFLAGS="-DLIBXML_STATIC=1 -I${out}/include/libxml2 \${CPPFLAGS}"
{% endif %}
{% endblock %}
