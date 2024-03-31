{% extends '//die/c/make.sh' %}

{% block git_repo %}
https://github.com/ndevilla/iniparser
{% endblock %}

{% block git_commit %}
deb85ad4936d4ca32cc2260ce43323d47936410d
{% endblock %}

{% block git_sha %}
a5876c2b204a43f34b5f3d664067003ddb063138b9bc5d55001865c97159dddb
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

{% block git_version %}
v3
{% endblock %}
