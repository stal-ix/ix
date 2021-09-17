{% extends '//util/template.sh' %}

{% block fetch %}
# url https://github.com/pg83/dlopen/archive/414a0b4dd7cc1a96f4d69b594d1e61237b6cdcde.zip
# md5 7f05ae68e09f7a25a7ed4f5d126a4c
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
