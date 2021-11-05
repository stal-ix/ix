{% extends 'template.sh' %}

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

{% block build %}
cd build && ninja -j ${make_thrs} all
{% endblock %}

{% block install %}
cd build && ninja install
{% endblock %}
