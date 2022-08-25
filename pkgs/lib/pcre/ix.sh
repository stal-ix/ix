{% extends 't/ix.sh' %}

{% block cmake_flags %}
{{super()}}
PCRE_BUILD_PCREGREP=OFF
PCRE_BUILD_TESTS=OFF
{% endblock %}

{% block env %}
export COFLAGS="--with-pcre=${out} \${COFLAGS}"
{% endblock %}

{% block install %}
{{super()}}
rm ${out}/lib/libpcreposix.a ${out}/lib/pkgconfig/libpcreposix.pc ${out}/include/pcreposix.h
{% endblock %}
