{% extends '//lib/mbedtls/t/ix.sh' %}

{% block pkg_name %}
mbedtls
{% endblock %}

{% block version %}
3.6.4
{% endblock %}

{% block git_repo %}
https://github.com/ARMmbed/mbedtls
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
aeb291a29bc3094f528e9e354d575e023c58b4f22abb6fabfe4b274c91bb4f59
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
