{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/strukturag/libde265/archive/refs/tags/v1.0.9.tar.gz
sha:153554f407718a75f1e0ae197d35b43147ce282118a54f894554dbe27c32163d
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block bld_libs %}
lib/shim/fake(lib_name=stdc++)
{% endblock %}
