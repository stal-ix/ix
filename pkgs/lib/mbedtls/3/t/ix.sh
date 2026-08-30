{% extends '//lib/mbedtls/t/ix.sh' %}

{% block pkg_name %}
mbedtls
{% endblock %}

{% block version %}
4.2.0
{% endblock %}

{% block git_repo %}
https://github.com/ARMmbed/mbedtls
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
d3c93b5764ddb1864593c589200c833e641b516f6f0686c479722894fd74591a
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
