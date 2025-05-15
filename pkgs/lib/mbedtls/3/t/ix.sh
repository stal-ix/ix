{% extends '//lib/mbedtls/t/ix.sh' %}

{% block pkg_name %}
mbedtls
{% endblock %}

{% block version %}
3.6.3.1
{% endblock %}

{% block git_repo %}
https://github.com/ARMmbed/mbedtls
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
23d5c76961364d21791f2e527d71164f43a4816b725317e5e81261f5f6dd708f
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
