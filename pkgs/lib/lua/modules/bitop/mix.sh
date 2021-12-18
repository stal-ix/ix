{% extends '//mix/template/c_std.sh' %}

{% block fetch %}
http://bitop.luajit.org/download/LuaBitOp-1.0.2.tar.gz
d0c1080fe0c844e8477279668e2d0d06
{% endblock %}

{% block lib_deps %}
lib/c/mix.sh
{% endblock %}

{% block bld_libs %}
lib/lua/mix.sh
{% endblock %}

{% block build %}
for x in *.c; do
    cc -c ${x}
done

ar qs libbitop.a *.o
{% endblock %}

{% block install %}
mkdir -p ${out}/lib ${out}/share/lua
cp libbitop.a ${out}/lib/
cp *.lua ${out}/share/lua/
nm libbitop.a | grep luaopen_ > ${out}/share/lua/mod
{% endblock %}

{% block env %}
export LUA_PATH="${out}/share/lua:\${LUA_PATH}"
{% endblock %}
