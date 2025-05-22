{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
qmmp
{% endblock %}

{% block version %}
2.2.6
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/qmmp-dev/qmmp/{{self.version().strip()[:3]}}/qmmp-{{self.version().strip()}}.tar.bz2
sha:270eca6fd728d9a0bc7f19e94e0e0e1f6a3c44dade648dffa58a0dbb7396cb4b
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
