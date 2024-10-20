{% extends '//lib/mbedtls/t/ix.sh' %}

{% block git_repo %}
https://github.com/ARMmbed/mbedtls
{% endblock %}

{% block git_branch %}
v3.6.2
{% endblock %}

{% block git_sha %}
57aeacc28b721e65dfa5438f2fa9a350eabb179308e3ccb63668950f8b751c72
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
