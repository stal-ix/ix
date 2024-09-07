{% extends '//lib/python/3/11/ix.sh' %}

{% block fetch %}
https://github.com/python/cpython/archive/refs/tags/v3.12.6.tar.gz
sha:657cf5f03430e308212c072281c26112dec29748eb461e358852252c5d000d02
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block cpp_includes %}
{{super()}}
${PWD}/Modules/_hacl/include
{% endblock %}

{% block build_flags %}
{{super()}}
wrap_cc
{% endblock %}
