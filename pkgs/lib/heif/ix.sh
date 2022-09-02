{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/strukturag/libheif/archive/refs/tags/v1.13.0.tar.gz
sha:50def171af4bc8991211d6027f3cee4200a86bbe60fddb537799205bf216ddca
{% endblock %}

{% block lib_deps %}
lib/c
lib/aom
lib/x265
lib/de265
lib/dav1d
{% endblock %}
