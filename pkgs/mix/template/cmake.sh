{% extends 'template.sh' %}

{% block configure %}
set -x
{% set cmflags %}
-DBUILD_SHARED_LIBS=OFF
{% block cmflags %}
{% endblock %}
{% endset %}

{% set cmdir %}
{% block cmdir %}
..
{% endblock %}
{% endset %}
which gcc
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
