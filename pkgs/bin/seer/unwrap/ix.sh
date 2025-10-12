{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
seer
{% endblock %}

{% block version %}
2.6
{% endblock %}

{% block fetch %}
https://github.com/epasveer/seer/archive/refs/tags/v{{self.version().strip()}}.tar.gz
79ab978ae456083d346e5604fdb503895f788577c72513598e4f1df4e98ba564
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
