{% extends '//die/c/ix.sh' %}

{% block bld_tool %}
bld/b2
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
lib/kernel
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
