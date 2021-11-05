{% extends 'ninja.sh' %}

{% block configure %}
{% set cmflags %}
{% block cmflags %}
{% endblock %}

{% block cmdir %}
..
{% endblock %}
{% endset %}

(
    build_cmake_prepare -G Ninja {{mix.fix_list(cmflags)}}
)
{% endblock %}
