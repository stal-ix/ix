{% extends '//die/autohell.sh' %}

{% block fetch %}
http://prdownloads.sourceforge.net/swig/swig-4.0.2.tar.gz
md5:7c3e46cb5af2b469722cafa0d91e127b
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/pcre
{% endblock %}

{% block bld_tool %}
bld/bison
{% endblock %}

{% block configure_flags %}
--with-boost=no
{% endblock %}
