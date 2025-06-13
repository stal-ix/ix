{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
seer
{% endblock %}

{% block version %}
2.5
{% endblock %}

{% block fetch %}
https://github.com/epasveer/seer/archive/refs/tags/v{{self.version().strip()}}.tar.gz
06f8eac1ab26149e6919c3bb021c1052f4da42c17b540d87db944682a81071b3
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/qt/6/svg
lib/qt/6/base
lib/qt/6/deps
lib/qt/6/charts
{% endblock %}

{% block unpack %}
{{super()}}
cd src
{% endblock %}
