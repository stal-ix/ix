{% extends '//lib/mbedtls/t/ix.sh' %}

{% block fetch %}
https://github.com/ARMmbed/mbedtls/archive/refs/tags/v3.4.1.tar.gz
sha:a420fcf7103e54e775c383e3751729b8fb2dcd087f6165befd13f28315f754f5
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
