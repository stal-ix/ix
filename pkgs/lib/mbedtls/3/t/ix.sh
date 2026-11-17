{% extends '//lib/mbedtls/t/ix.sh' %}

# noauto

{% block pkg_name %}
mbedtls
{% endblock %}

{% block version %}
3.6.8
{% endblock %}

{% block git_repo %}
https://github.com/ARMmbed/mbedtls
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
beb1b8421ce4a7dd5b5851575c81b7706e545e828a81fd0a2a84139cb2445e5e
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
