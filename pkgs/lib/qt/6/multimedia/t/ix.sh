{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtmultimedia/archive/refs/tags/v6.5.1.tar.gz
sha:17bc61e2ba886e6c6a1f73be84b8dd78ad9a87b469544224671e261f7debded2
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/qt/6/base
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
