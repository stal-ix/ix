{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/ndevilla/iniparser/archive/deb85ad4936d4ca32cc2260ce43323d47936410d.zip
sha:56338b33e3caa03be20240c0cbbf0d829938c18c0d5ff8c0d7be5dcd7d4cbde1
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
