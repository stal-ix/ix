{% extends '//lib/python/3/11/ix.sh' %}

{% block fetch %}
https://github.com/python/cpython/archive/refs/tags/v3.12.5.tar.gz
sha:4370d21ad07454ccbeae703701d6fe24e8227e44ee1591a0ed8f2f9c2df4e680
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
