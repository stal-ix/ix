{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/7mind/jopa
{% endblock %}

{% block git_commit %}
d63f7c1f7cc6a50c3bbbb2ae2a2297b87331a766
{% endblock %}

{% block git_sha %}
a08c322254f038c692b2d9ea307635efdd3bea02e1b5d64fe383016f776da7a8
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/icu
lib/zip
{% endblock %}
