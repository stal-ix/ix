{% extends '//mix/c_std.sh' %}

{% block fetch %}
https://boostorg.jfrog.io/artifactory/main/release/1.79.0/source/boost_1_79_0.tar.bz2
sha:475d589d51a7f8b3ba2ba4eda022b170e562ca3b760ee922c146b6c65856ef39
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

{% block build_flags %}
shut_up
{% endblock %}

{% block patch %}
sed -e 's|::mode_t|int|' -i boost/interprocess/permissions.hpp
{% endblock %}
