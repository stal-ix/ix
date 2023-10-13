{% extends '//lib/python/3/11/ix.sh' %}

{% block fetch %}
https://github.com/python/cpython/archive/refs/tags/v3.12.0.tar.gz
sha:ddfaf383c97f393a7768943630ea01e6c3cfb9af4fbc02655a37a2f3680013d6
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
