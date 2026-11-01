{% extends '//lib/lua/puc/5/t/ix.sh' %}

{% block pkg_name %}
lua
{% endblock %}

{% block version %}
5.4.9
{% endblock %}

{% block fetch %}
https://www.lua.org/ftp/lua-{{self.version().strip()}}.tar.gz
2335b6c582a52654f94612bf10d2f4672805d05329aa6568b1d8cd9e5c6fb8e6
{% endblock %}
