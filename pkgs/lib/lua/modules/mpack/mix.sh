{% extends '//mix/template/c_std.sh' %}

{% block fetch %}
https://github.com/libmpack/libmpack-lua/archive/refs/tags/1.0.9.tar.gz
a2d0d5e25aefc7b3b51c816de8096fd6
{% endblock %}

{% block lib_deps %}
lib/c/mix.sh
lib/mpack/mix.sh
{% endblock %}

{% block bld_libs %}
lib/lua/mix.sh
{% endblock %}

{% block build %}
for x in *.c; do
    cc -DMPACK_USE_SYSTEM=1 -c ${x}
done

ar qs libmpack.a *.o
{% endblock %}

{% block install %}
mkdir -p ${out}/lib ${out}/share/lua
cp libmpack.a ${out}/lib/
cp *.lua ${out}/share/lua/
nm libmpack.a | grep luaopen_ > ${out}/share/lua/mod
{% endblock %}

{% block env %}
export LUA_PATH="${out}/share/lua:\${LUA_PATH}"
{% endblock %}
