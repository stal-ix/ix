{% extends '//die/c/qt.sh' %}

{% block pkg_name %}
qtimageformats
{% endblock %}

{% block version %}
6.7.2
{% endblock %}

{% block fetch %}
https://github.com/qt/qtimageformats/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:24c250ab9de80366ede458038833b253de6d3bba02b4691d75f849b06bbebc16
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/webp
lib/tiff
lib/jasper
lib/qt/6/base
{% endblock %}
