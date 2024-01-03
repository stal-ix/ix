{% extends '//die/c/autohell.sh' %}

{% block fetch %}
http://prdownloads.sourceforge.net/swig/swig-4.2.0.tar.gz
sha:261ca2d7589e260762817b912c075831572b72ff2717942f75b3e51244829c97
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
