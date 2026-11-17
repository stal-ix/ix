{% extends '//lib/mbedtls/t/ix.sh' %}

# noauto

{% block pkg_name %}
mbedtls
{% endblock %}

{% block version %}
4.3.0
{% endblock %}

{% block git_repo %}
https://github.com/ARMmbed/mbedtls
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
43627d05881ef3cd1bb4b5b777af380a3fa9e8d75e06df23539cdbf0c6a3a3dc
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
{{super()}}
pip/jinja2
pip/jsonschema
{% endblock %}

{% block bld_tool %}
bld/perl
{{super()}}
{% endblock %}
