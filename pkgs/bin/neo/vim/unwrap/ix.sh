{% extends 't/ix.sh' %}

{% block bld_libs %}
{{super()}}
bin/neo/vim/doc/dl
lib/lua/modules/lpeg
lib/lua/modules/bitop
lib/tree/sitter/plugins
bin/neo/vim/unwrap/nlua0/dl
{% endblock %}

{% block bld_tool %}
{{super()}}
bin/neo/vim/1(lua_ver={{lua_ver}})
{% endblock %}
