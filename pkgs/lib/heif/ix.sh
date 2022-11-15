{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/strukturag/libheif/archive/refs/tags/v1.14.0.tar.gz
sha:9901cb0743caa80c316fabcf785c39466f41dda5c42152f2b7992be43db8d047
{% endblock %}

{% block lib_deps %}
lib/c
lib/aom
lib/x265
lib/de265
lib/dav1d
{% endblock %}
