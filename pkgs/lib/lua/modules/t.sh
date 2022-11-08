{% extends '//die/c/ix.sh' %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/lua
{% endblock %}

{% block run_data %}
{% if lib %}
{{name}}
{% endif %}
{% endblock %}

{% block bld_data %}
{% if lib %}
{{name}}
{% endif %}
{% endblock %}

{% block build %}
for x in *.c; do
    cc -c ${x}
done

ar qs lib{{uniq_id}}.a *.o
{% endblock %}

{% block install %}
mkdir -p ${out}/lib ${out}/share/lua
cp lib{{uniq_id}}.a ${out}/lib/
cp *.lua ${out}/share/lua/
nm lib{{uniq_id}}.a | grep luaopen_ > ${out}/share/lua/mod
{% endblock %}

{% block script_init_env %}
export LUA_PATH=
{{super()}}
{% endblock %}

{% block env_lib %}
export LUA_PATH="${out}/share/lua:\${LUA_PATH}"
{% endblock %}

{% block postinstall %}
echo 'TODO(pg): move mod file from share'
{% endblock %}
