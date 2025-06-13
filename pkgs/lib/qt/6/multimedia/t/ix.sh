{% extends '//die/c/qt.sh' %}

{% block pkg_name %}
qtmultimedia
{% endblock %}

{% block version %}
6.7.2
{% endblock %}

{% block fetch %}
https://github.com/qt/qtmultimedia/archive/refs/tags/v{{self.version().strip()}}.tar.gz
2e95e71edb99e20176f52f81b93d872fc1b7c2b7a6b74e5893bb7efae45a7f25
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
