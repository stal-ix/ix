{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtmultimedia/archive/refs/tags/v6.6.3.tar.gz
sha:045ec362e4ea7b05d68dfbcb73e58d3958cec2735532f03d07167389ac9d7124
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
