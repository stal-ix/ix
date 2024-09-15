{% extends '//lib/lua/jit/ix.sh' %}

{% block bld_libs %}
lib/lua/modules/lpeg
lib/lua/modules/bitop
bin/neo/vim/unwrap/nlua0/dl
{{super()}}
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/bin/luajit ${out}/bin/lua
{% endblock %}
