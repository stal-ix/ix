{% extends '//util/template.sh' %}

{% block fetch %}
# url https://github.com/pg83/dlopen/archive/43ff7bf7df67c01c7dc4a1b7608c16e4597cb2ab.zip
# md5 5bc95a3f3980ccdb61fec3313ce7b6f3
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
