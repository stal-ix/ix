{% extends '//lib/python/3/11/ix.sh' %}

{% block pkg_name %}
python
{% endblock %}

{% block version %}
3.12.12
{% endblock %}

{% block fetch %}
https://github.com/python/cpython/archive/refs/tags/v{{self.version().strip()}}.tar.gz
75fb57ada69fbd9c95964508a0ebb37aa4086dde48debb22771cd8cc4338226c
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
wrap_rdynamic_fake
{% endblock %}
