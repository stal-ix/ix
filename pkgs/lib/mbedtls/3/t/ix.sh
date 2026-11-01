{% extends '//lib/mbedtls/t/ix.sh' %}

# noauto

{% block pkg_name %}
mbedtls
{% endblock %}

{% block version %}
3.6.7
{% endblock %}

{% block git_repo %}
https://github.com/ARMmbed/mbedtls
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
5c20d7141153f351c0acddf284cf8aac0aab1db97d56c0361a5f75100c31852c
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
