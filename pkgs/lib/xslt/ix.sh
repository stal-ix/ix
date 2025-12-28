{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libxslt
{% endblock %}

{% block version %}
1.1.45
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libxslt/-/archive/v{{self.version().strip()}}/libxslt-v{{self.version().strip()}}.tar.bz2
8e00aa4e1749ee7244d08683ce2bb6fec7fd99baa6ef5d5f091274b318e6925e
{% endblock %}

{% block lib_deps %}
lib/c
lib/xml/2
{% endblock %}

{% block configure_flags %}
--with-python=no
--without-python
{% endblock %}
