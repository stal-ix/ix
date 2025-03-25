{% extends '//lib/mbedtls/t/ix.sh' %}

{% block git_repo %}
https://github.com/ARMmbed/mbedtls
{% endblock %}

{% block git_branch %}
v3.6.3
{% endblock %}

{% block git_sha %}
eb7872419e93852c04034872786d6b38839c784c76c2444f7c00f3a1c4dfc45b
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
