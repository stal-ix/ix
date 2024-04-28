{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/ndevilla/iniparser/archive/refs/tags/v4.2.tar.gz
sha:dbcbaf3aedb4f88a9fc0df4b315737ddd10e6c37918e3d89f0ecc475333bde4d
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block make_target %}
libiniparser.a
{% endblock %}

{% block install %}
mkdir -p ${out}/include ${out}/lib/pkgconfig
cp src/*.h ${out}/include/
cp *.a ${out}/lib/
cp *.pc ${out}/lib/pkgconfig/
sed -e "s|/usr|${out}|" -i ${out}/lib/pkgconfig/iniparser.pc
{% endblock %}
