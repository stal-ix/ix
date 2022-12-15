{% extends '//die/c/ix.sh' %}

{% block fetch %}
https://boostorg.jfrog.io/artifactory/main/release/1.81.0/source/boost_1_81_0.tar.bz2
sha:71feeed900fbccca04a3b4f2f84a7c217186f28a940ed8b7ed4725986baf99fa
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
