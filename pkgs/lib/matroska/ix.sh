{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/Matroska-Org/libmatroska/archive/refs/tags/release-1.7.0.tar.gz
sha:47f6ec7fbb32af8b2f8b640c49faac755fd376d732b3fdb68ad802fe5420ee88
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/ebml
{% endblock %}
