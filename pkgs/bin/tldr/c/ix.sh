{% extends '//die/c/make.sh' %}

{% block pkg_name %}
tldr-c-client
{% endblock %}

{% block version %}
1.6.1
{% endblock %}

{% block fetch %}
https://github.com/tldr-pages/tldr-c-client/archive/refs/tags/v{{self.version().strip()}}.tar.gz
1a2aa8e764846fad1f41a0304e28416f5c38b6d3a3131ad1e85116749aec34ba
{% endblock %}

{% block bld_libs %}
lib/c
lib/fts
lib/zip
lib/curl
{% endblock %}

{% block bld_tool %}
bld/pkg/config
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block make_flags %}
CC=clang
CXX=clang++
{% endblock %}
