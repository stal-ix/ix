{% extends '//die/c/ix.sh' %}

{% block lib_deps %}
{% if lib %}
lib/c
lib/lua
{% endif %}
{% endblock %}

{% block use_data %}
{% if lib %}
{{name}}(lua_ver={{lua_ver | defined('lua_ver')}})
{% endif %}
lib/lua/env
{% endblock %}

{% block build %}
{% if lib %}
for x in *.c; do
    cc -c ${x}
done
ar qs lib{{uniq_id}}.a *.o
{% else %}
echo 'prepare lua files'
{% endif %}
{% endblock %}

{% block install %}
{% if lib %}
mkdir ${out}/lib
cp lib{{uniq_id}}.a ${out}/lib/
nm lib{{uniq_id}}.a | grep luaopen_ > ${out}/lib/mod
{% else %}
mkdir -p ${out}/share/lua
cp *.lua ${out}/share/lua/
{% endif %}
{% endblock %}

{% block env %}
{% if lib %}
export LUA_MOD="${out}/lib/mod:\${LUA_MOD}"
{% else %}
export LUA_PATH="${out}/share/lua:\${LUA_PATH}"
{% endif %}
{% endblock %}
