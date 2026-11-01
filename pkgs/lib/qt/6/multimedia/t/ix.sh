{% extends '//die/c/qt.sh' %}

{% block pkg_name %}
qtmultimedia
{% endblock %}

{% block version %}
6.12.0
{% endblock %}

{% block fetch %}
https://github.com/qt/qtmultimedia/archive/refs/tags/v{{self.version().strip()}}.tar.gz
896543478b9dcdc1811e2960f74d926572cf5d97ce9ad7a53b6ea335cafe8561
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/qt/6/base
lib/qt/6/declarative
lib/qt/6/shadertools
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/qt/6
bld/qt/6/tools/shader
{% endblock %}

{% block env %}
{{super()}}
export QT_PATH="${out}:\${QT_PATH}"
export CPPFLAGS="-I${out}/include/QtMultimedia \${CPPFLAGS}"
{% endblock %}
