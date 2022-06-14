{% extends '//die/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtbase/archive/refs/tags/v6.3.1.tar.gz
sha:4393e8cea0c58b1e0e901735fcffad141261576a0fa414ed6309910ac3d49df9
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
lib/double/conversion
{% endblock %}

{% block cmake_flags %}
{{super()}}
QT_FEATURE_reduce_relocations=OFF
QT_FEATURE_static_runtime=ON
QT_FEATURE_static=ON
QT_FEATURE_shared=OFF
{% endblock %}
