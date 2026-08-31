{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
stp
{% endblock %}

{% block version %}
2.4.1
{% endblock %}

{% block git_sha %}
a70c13e5b814a1b1a02bc6b55b1afef567e92843ab0d5d3101db04d2b2a161c1
{% endblock %}

{% block git_repo %}
https://github.com/stp/stp
{% endblock %}

{% block git_commit %}
295953fc1f7424cc4822a02f5c7964e0aafbdf10
{% endblock %}

{% block git_version %}
v4
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/gmp/c++
lib/mini/sat
{% endblock %}

{% block cmake_flags %}
STP_ALLOCATOR=tcmalloc
{% endblock %}

{% block bld_tool %}
bld/git
bld/make
bld/perl
bld/flex
bld/bison
bld/help2man
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
