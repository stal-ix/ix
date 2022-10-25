{% extends '//die/c/autohell.sh' %}

{% block fetch %}
http://prdownloads.sourceforge.net/swig/swig-4.1.0.tar.gz
sha:d6a9a8094e78f7cfb6f80a73cc271e1fe388c8638ed22668622c2c646df5bb3d
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
