{% extends '//mix/template/c_std.sh' %}

{% block lib_deps %}
lib/c/mix.sh
{% endblock %}

{% block bld_libs %}
lib/lua/mix.sh
{% endblock %}

{% block run_data %}
{% if kind == 'lib' %}
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

{% block env %}
export LUA_PATH="${out}/share/lua:\${LUA_PATH}"
{% endblock %}
