{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/c-ares/c-ares/archive/refs/tags/cares-1_18_1.tar.gz
a0ec0dd35fd6c06544333d250e21ab22
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block std_box %}
bld/bootbox
{% endblock %}

{% block cmake_flags %}
CARES_STATIC=ON
CARES_SHARED=OFF
{% endblock %}

{% block env %}
export COFLAGS="--with-ares=${out} --enable-ares=${out} \${COFLAGS}"
export LDFLAGS="-lresolv \${LDFLAGS}"
{% endblock %}

{% block install %}
{{super()}}

{% if lib %}
sed -e 's|^exec_prefix.*||' -i ${out}/lib/pkgconfig/libcares.pc
{% endif %}
{% endblock %}
