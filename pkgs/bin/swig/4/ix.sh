{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
swig
{% endblock %}

{% block version %}
4.4.0
{% endblock %}

{% block fetch %}
http://prdownloads.sourceforge.net/swig/swig-{{self.version().strip()}}.tar.gz
c3f8e5dcd68c18aa19847b33b0a1bb92f07e904c53ae9cf5ae4ff8727a72927e
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/pcre/2
{% endblock %}

{% block bld_tool %}
bld/bison
{% endblock %}

{% block configure_flags %}
--with-boost=no
{% endblock %}
