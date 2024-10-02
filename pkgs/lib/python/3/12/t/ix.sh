{% extends '//lib/python/3/11/ix.sh' %}

{% block fetch %}
https://github.com/python/cpython/archive/refs/tags/v3.12.7.tar.gz
sha:0c4db8f00ab490bfb5a4b0d0e763319d017226b5521f97e851412342ff04d459
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
