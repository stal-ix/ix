{% extends '//mix/template/c_std.sh' %}

{% block fetch %}
https://boostorg.jfrog.io/artifactory/main/release/1.78.0/source/boost_1_78_0.tar.bz2
sha:8681f175d4bdb26c52222665793eef08490d7758529330f98d3b29dd0735bccc
{% endblock %}

{% block bld_tool %}
bin/b2
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block bld_libs %}
lib/linux
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
{% endblock %}

{% block setup %}
export CPPFLAGS="-w ${CPPFLAGS}"
{% endblock %}

{% block patch %}
sed -e 's|::mode_t|int|' -i boost/interprocess/permissions.hpp
{% endblock %}
