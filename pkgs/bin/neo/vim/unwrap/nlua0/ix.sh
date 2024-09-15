{% extends '//bin/neo/vim/unwrap/t/ix.sh' %}

{% block bld_tool %}
{{super()}}
bin/neo/vim/0(lua_ver=puc/5/2)
{% endblock %}

{% block ninja_build_targets %}
lib/libnlua0.so
{% endblock %}

{% block install %}
mkdir ${out}/lib
cp ${tmp}/lib/libnlua0.a ${out}/lib/
{% endblock %}
