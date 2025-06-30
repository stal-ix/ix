{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
qmmp
{% endblock %}

{% block version %}
2.2.7
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/qmmp-dev/qmmp/{{self.version().strip()[:3]}}/qmmp-{{self.version().strip()}}.tar.bz2
ddcff0b618f4790802f6d52d9a796b5f32cb7d0f23c99181b804f614fab5fbb2
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
