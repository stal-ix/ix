{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/microsoft/LightGBM
{% endblock %}

{% block git_branch %}
v4.3.0
{% endblock %}

{% block git_sha %}
fd3543d47b86336de138e78840eed20b3a544d21ce1078585f5a8d8341b721d2
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/fmt
lib/omp
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
