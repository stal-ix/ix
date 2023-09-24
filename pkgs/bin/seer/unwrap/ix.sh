{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/epasveer/seer/archive/refs/tags/v2.2.tar.gz
sha:9aea234a4b499ca9f4f3bd170bdda84f1d7076938bb77d59d2294b3339a469c4
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
