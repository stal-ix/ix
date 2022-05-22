{% extends '//die/make.sh' %}

{% block fetch %}
https://github.com/dlbeer/quirc/archive/refs/tags/v1.1.tar.gz
sha:5102ccb57639cb355642c1f8af0d815026c948d85d99bf9b86be5746e759f8e6
{% endblock %}

{% block lib_deps %}
lib/c
lib/jpeg
{% endblock %}

{% block bld_tool %}
bld/pkg/config
{% endblock %}

{% block make_target %}
libquirc.a
{% endblock %}

{% block install %}
mkdir ${out}/lib ${out}/include
cp lib/quirc.h ${out}/include/
cp libquirc.a ${out}/lib/
{% endblock %}
