{% extends '//lib/qt/6/base/t/ix.sh' %}

{% block lib_deps %}
lib/c
lib/z
lib/b2
lib/c++
lib/pcre/2
lib/openssl
lib/sqlite/3
lib/double/conversion
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block cmake_flags %}
{{super()}}
QT_FEATURE_sql=ON
QT_FEATURE_system_sqlite=ON
QT_FEATURE_gui=OFF
QT_FEATURE_widgets=OFF
QT_FEATURE_opengl=OFF
QT_FEATURE_testlib=OFF
{% endblock %}

{% block env %}
{{super()}}
export CMFLAGS="-DQT_DISABLE_NO_DEFAULT_PATH_IN_QT_PACKAGES=ON -DBUILD_WITH_QT6=ON \${CMFLAGS}"
{% endblock %}
