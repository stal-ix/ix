{% extends '//lib/lua/puc/5/t/ix.sh' %}

{% block pkg_name %}
lua
{% endblock %}

{% block version %}
5.2.4
{% endblock %}

{% block fetch %}
https://www.lua.org/ftp/lua-{{self.version().strip()}}.tar.gz
b9e2e4aad6789b3b63a056d442f7b39f0ecfca3ae0f1fc0ae4e9614401b69f4b
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/shim/fake/pkg(pkg_name=lua{{self.version().strip()[:3]}},pkg_ver={{self.version().strip()}})
{% endblock %}

{% block make_target %}
{{target.os}}
{% endblock %}
