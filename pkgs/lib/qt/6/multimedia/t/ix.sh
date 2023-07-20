{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtmultimedia/archive/refs/tags/v6.5.2.tar.gz
sha:169fbcd3a9e2e6630d91ead87229c8cbda75dd85d9ada85735af746f29c97823
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
