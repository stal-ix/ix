{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
qmmp
{% endblock %}

{% block version %}
2.3.0
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/qmmp-dev/qmmp/{{self.version().strip()[:3]}}/qmmp-{{self.version().strip()}}.tar.bz2
01c3e30367c885178cd115594d20f694a47a352fd7e65fcf5722e12ac8333063
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
