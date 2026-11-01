{% extends '//lib/python/3/11/ix.sh' %}

{% block pkg_name %}
python
{% endblock %}

{% block version %}
3.12.16
{% endblock %}

{% block fetch %}
https://github.com/python/cpython/archive/refs/tags/v{{self.version().strip()}}.tar.gz
e0fac3812252d674de7d82d206d2205297f6da97702a3db5715d1f91f1217264
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
