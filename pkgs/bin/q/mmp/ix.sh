{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
qmmp
{% endblock %}

{% block version %}
2.4.1
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/qmmp-dev/qmmp/{{self.version().strip()[:3]}}/qmmp-{{self.version().strip()}}.tar.bz2
5a0a6f1efcefe9cc4b1ff3ae4038493168baec0b12989ca116af2454098825ed
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
