{% extends '//lib/lua/jit/ix.sh' %}

{% block pkg_name %}
luajit2
{% endblock %}

{% block version %}
20230911
{% endblock %}

{% block fetch %}
https://github.com/openresty/luajit2/archive/refs/tags/v2.1-{{self.version().strip()}}.tar.gz
d08c23a0c793261cad1775795f258ca2149642eb19d3679a6bbb77582fa1d206
{% endblock %}
