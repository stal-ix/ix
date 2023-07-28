{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/qmmp-dev/qmmp/2.1/qmmp-2.1.4.tar.bz2
sha:81b4240d9832a36d954d6a448b1b92d966a2c305e0283b275db07a43453439e3
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/qt/6/base
lib/qt/6/deps
{% endblock %}

{% block bld_tool %}
bld/qt/6
bld/qt/6/tools
{% endblock %}
