{% extends '//die/c/ix.sh' %}

{% block fetch %}
https://boostorg.jfrog.io/artifactory/main/release/1.80.0/source/boost_1_80_0.tar.bz2
sha:1e19565d82e43bc59209a168f5ac899d3ba471d55c7610c677d4ccf2c9c500c0
{% endblock %}

{% block bld_tool %}
bld/b2
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block configure %}
sh bootstrap.sh --prefix=${out} \
    --with-bjam=$(which b2) \
    --without-icu \
    --without-libraries=python \
    --with-toolset=clang
{% endblock %}

{% block build %}
b2 link=static
{% endblock %}

{% block install %}
b2 link=static install
sed -e 's|len + 1}|int(len + 1)}|' -i ${out}/include/boost/process/detail/posix/executor.hpp
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block patch %}
sed -e 's|::mode_t|int|' -i boost/interprocess/permissions.hpp
{% endblock %}

{% block env %}
export COFLAGS="--with-boost=${out} \${COFLAGS}"
{% endblock %}
