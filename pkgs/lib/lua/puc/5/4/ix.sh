{% extends '//lib/lua/puc/5/t/ix.sh' %}

{% block pkg_name %}
lua
{% endblock %}

{% block version %}
5.4.8
{% endblock %}

{% block fetch %}
https://www.lua.org/ftp/lua-{{self.version().strip()}}.tar.gz
sha:4f18ddae154e793e46eeab727c59ef1c0c0c2b744e7b94219710d76f530629ae
{% endblock %}
