{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/ndevilla/iniparser/archive/refs/tags/v4.2.1.tar.gz
sha:9120fd13260be1dbec74b8aaf47777c434976626f3b3288c0d17b70e21cce2d2
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
