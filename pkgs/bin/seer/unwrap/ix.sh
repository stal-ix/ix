{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
seer
{% endblock %}

{% block version %}
2.7
{% endblock %}

{% block git_repo %}
https://github.com/epasveer/seer
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
d1d39d30fa8ac29f27c08533bab06be89f1f5ffcfc351edae3a2daf6fbdc98bd
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
