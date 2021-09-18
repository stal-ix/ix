{% extends '//util/template.sh' %}

{% block fetch %}
# url https://github.com/pg83/dlopen/archive/d2c2bd39dbecb6f3d130e291e9487ebb5a475f14.zip
# md5 7ca8bde3f89f0252cb55d4e6ace26838
{% endblock %}

{% block deps %}
# lib lib/cxx
# bld dev/build/make env/std
{% endblock %}

{% block build %}
make
{% endblock %}

{% block install %}
make PREFIX=${out} install
mv $out/lib/libdl.a $out/lib/libdlstub.a
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include \${CPPFLAGS}"
export LDFLAGS="-L${out}/lib -ldlstub \${LDFLAGS}"
{% endblock %}
