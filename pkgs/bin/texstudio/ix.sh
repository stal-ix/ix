{% extends '//die/c/cmake.sh' %}

{# hard X11 dep #}

{% block fetch %}
https://github.com/texstudio-org/texstudio/archive/refs/tags/4.4.1.tar.gz
sha:83c46c971081c053a01a186b4a7fbb492d75bef4070ff8fa045311eda186562b
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/shim/x11
lib/qt/6/base
lib/qt/6/deps
lib/qt/6/compat
lib/qt/6/declarative
{% endblock %}

{% block bld_tool %}
bld/qt/6
bld/qt/6/tools
bld/qt/6/tools/qml
{% endblock %}
