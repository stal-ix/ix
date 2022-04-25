{% extends '//mix/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtbase/archive/refs/tags/v6.3.0.tar.gz
sha:c50dc73f633e6c0f6ee3f51980c698800f1a0cadb423679bcef18e446ac72138
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
