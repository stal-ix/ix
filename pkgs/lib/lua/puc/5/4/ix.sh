{% extends '//lib/lua/puc/5/t/ix.sh' %}

{% block pkg_name %}
lua
{% endblock %}

{% block version %}
5.4.7
{% endblock %}

{% block fetch %}
https://www.lua.org/ftp/lua-{{self.version().strip()}}.tar.gz
sha:9fbf5e28ef86c69858f6d3d34eccc32e911c1a28b4120ff3e84aaa70cfbf1e30
{% endblock %}
