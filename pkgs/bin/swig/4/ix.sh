{% extends '//die/c/autohell.sh' %}

{% block fetch %}
http://prdownloads.sourceforge.net/swig/swig-4.2.1.tar.gz
sha:fa045354e2d048b2cddc69579e4256245d4676894858fcf0bab2290ecf59b7d8
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
