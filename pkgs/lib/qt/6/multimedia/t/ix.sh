{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtmultimedia/archive/refs/tags/v6.6.2.tar.gz
sha:e8d0707bf10759d98ca03a2f601ab34b08b9ff1dafdcc9975c24a8993926d604
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
