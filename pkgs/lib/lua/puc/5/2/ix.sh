{% extends '//lib/lua/puc/5/t/ix.sh' %}

{% block fetch %}
https://www.lua.org/ftp/lua-5.2.4.tar.gz
sha:b9e2e4aad6789b3b63a056d442f7b39f0ecfca3ae0f1fc0ae4e9614401b69f4b
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/genpc
{% endblock %}

{% block make_target %}
{{target.os}}
{% endblock %}

{% block install %}
{{super()}}
genpc "lua5.2" "5.2.4"
{% endblock %}
