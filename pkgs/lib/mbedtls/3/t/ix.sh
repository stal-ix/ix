{% extends '//lib/mbedtls/t/ix.sh' %}

{% block git_repo %}
https://github.com/ARMmbed/mbedtls
{% endblock %}

{% block git_branch %}
v3.6.0
{% endblock %}

{% block git_sha %}
649026e3d4c04de2203059b36ed2866217990b62876b99bd915e9138ee28f47b
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
