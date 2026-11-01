{% extends '//die/c/qt.sh' %}

{% block pkg_name %}
qtimageformats
{% endblock %}

{% block version %}
6.12.0
{% endblock %}

{% block fetch %}
https://github.com/qt/qtimageformats/archive/refs/tags/v{{self.version().strip()}}.tar.gz
9848d06aa4453cf583dc6ec4ec148ade05f3981c0f91b0961297385d3297b02a
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/webp
lib/tiff
lib/jasper
lib/qt/6/base
{% endblock %}
