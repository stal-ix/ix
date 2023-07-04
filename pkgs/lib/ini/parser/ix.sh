{% extends '//die/c/make.sh' %}

{% block git_repo %}
https://github.com/ndevilla/iniparser
{% endblock %}

{% block git_commit %}
deb85ad4936d4ca32cc2260ce43323d47936410d
{% endblock %}

{% block git_sha %}
fc144ba14632c0263654097584facbbdcb0a459f1f048a789c5f9cc32b959991
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
