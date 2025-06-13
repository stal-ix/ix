{% extends '//lib/lua/puc/5/t/ix.sh' %}

{% block pkg_name %}
lua
{% endblock %}

{% block version %}
5.1.5
{% endblock %}

{% block fetch %}
https://www.lua.org/ftp/lua-{{self.version().strip()}}.tar.gz
2640fc56a795f29d28ef15e13c34a47e223960b0240e8cb0a82d9b0738695333
{% endblock %}

{% block make_target %}
{{target.os}}
{% endblock %}
