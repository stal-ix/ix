{% extends '//die/c/autohell.sh' %}

{% block fetch %}
http://prdownloads.sourceforge.net/swig/swig-4.3.0.tar.gz
sha:f7203ef796f61af986c70c05816236cbd0d31b7aa9631e5ab53020ab7804aa9e
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
