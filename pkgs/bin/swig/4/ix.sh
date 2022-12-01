{% extends '//die/c/autohell.sh' %}

{% block fetch %}
http://prdownloads.sourceforge.net/swig/swig-4.1.1.tar.gz
sha:2af08aced8fcd65cdb5cc62426768914bedc735b1c250325203716f78e39ac9b
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
