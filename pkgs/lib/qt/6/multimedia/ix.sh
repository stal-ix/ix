{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtmultimedia/archive/refs/tags/v6.4.3.tar.gz
sha:dc24ecb7679ac4381e99d8573a45f111065362cd3870b113e40150d89f1c4511
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
