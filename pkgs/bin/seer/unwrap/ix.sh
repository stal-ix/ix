{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
seer
{% endblock %}

{% block version %}
2.7
{% endblock %}

{% block fetch %}
https://github.com/epasveer/seer/archive/refs/tags/v{{self.version().strip()}}.tar.gz
de084162acc9093a877b29e61d1ad6a677131936fa926b578980d894c412be8f
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/qt/6/svg
lib/qt/6/base
lib/qt/6/deps
lib/qt/6/charts
{% endblock %}

{% block bld_tool %}
bld/qt/6
bld/qt/6/tools
{% endblock %}

{% block unpack %}
{{super()}}
cd src
{% endblock %}
