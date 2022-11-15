{% extends '//lib/qt/6/base/t/ix.sh' %}

{% block lib_deps %}
lib/c
lib/z
lib/b2
lib/c++
lib/pcre/2
lib/openssl
lib/double/conversion
{% endblock %}

{% block cmake_flags %}
{{super()}}
QT_FEATURE_sql=OFF
QT_FEATURE_gui=OFF
QT_FEATURE_widgets=OFF
QT_FEATURE_opengl=OFF
QT_FEATURE_testlib=OFF
{% endblock %}
