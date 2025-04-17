{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
swig
{% endblock %}

{% block version %}
4.3.1
{% endblock %}

{% block fetch %}
http://prdownloads.sourceforge.net/swig/swig-{{self.version().strip()}}.tar.gz
sha:44fc829f70f1e17d635a2b4d69acab38896699ecc24aa023e516e0eabbec61b8
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
