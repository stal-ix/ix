{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
seer
{% endblock %}

{% block version %}
2.8.1
{% endblock %}

{% block git_repo %}
https://github.com/epasveer/seer
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
7a6735013447c5019c83fe68eb5b4678275797ec9e264e3480aca18468514e19
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

{% block step_unpack %}
{{super()}}
cd src
{% endblock %}
