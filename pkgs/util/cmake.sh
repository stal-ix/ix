{% extends '//util/template.sh' %}

{% block configure %}
{% set cmflags %}
{% block cmflags %}
{% endblock %}
{% endset %}

{% set cmdir %}
{% block cmdir %}
..
{% endblock %}
{% endset %}

(
    build_cmake_prepare -G Ninja {{mix.prepare_deps(cmflags)}} {{cmdir.strip()}}
)
{% endblock %}

{% block build %}
cd build && ninja -j ${make_thrs} all
{% endblock %}

{% block install %}
cd build && ninja install
{% endblock %}
