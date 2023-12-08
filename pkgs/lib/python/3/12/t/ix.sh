{% extends '//lib/python/3/11/ix.sh' %}

{% block fetch %}
https://github.com/python/cpython/archive/refs/tags/v3.12.1.tar.gz
sha:9f58fd14f083882fb6cb855927e99fb5c77f58fbf15f695736549d31e6be372a
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
