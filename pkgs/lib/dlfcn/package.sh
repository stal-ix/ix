{% extends '//util/template.sh' %}

{% block fetch %}
# url https://github.com/pg83/dlopen/archive/69bafdb256c8abc810e590889b8e019fff6c7aa7.zip
# md5 7f05ae68e09f7a25a7ed4f5d126a4cac
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
mkdir $out/lib && mv $out/bin/libdl.a $out/lib/libdlstub.a
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include \${CPPFLAGS}"
export LDFLAGS="-L${out}/lib -ldlstub \${LDFLAGS}"
{% endblock %}
