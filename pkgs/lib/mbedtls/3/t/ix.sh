{% extends '//lib/mbedtls/t/ix.sh' %}

{% block git_repo %}
https://github.com/ARMmbed/mbedtls
{% endblock %}

{% block git_branch %}
v3.6.0
{% endblock %}

{% block git_sha %}
12d4cc5b6e11dc94aa79f4aa3620c78e607ab0da01b7ac76c15090398a1b0722
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
