{% extends '//lib/lua/puc/5/t/ix.sh' %}

{% block pkg_name %}
lua
{% endblock %}

{% block version %}
5.5.0
{% endblock %}

{% block fetch %}
https://www.lua.org/ftp/lua-{{self.version().strip()}}.tar.gz
57ccc32bbbd005cab75bcc52444052535af691789dba2b9016d5c50640d68b3d
{% endblock %}
