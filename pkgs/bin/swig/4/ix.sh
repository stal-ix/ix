{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
swig
{% endblock %}

{% block version %}
4.5.0
{% endblock %}

{% block fetch %}
http://prdownloads.sourceforge.net/swig/swig-{{self.version().strip()}}.tar.gz
22ae0e887f8cca8031a325c67d005207653200b40e71edb3f88780e28e47d0ff
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
