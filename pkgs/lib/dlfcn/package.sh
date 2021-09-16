{% extends '//util/template.sh' %}

{% block fetch %}
# url https://github.com/pg83/dlopen/archive/069ed3be796527c36455b94b448939aeacda3a92.zip
# md5 024ccae9d27f2460c802434ea8f3ad3b
{% endblock %}

{% block deps %}
# lib lib/musl lib/cxx
# bld dev/build/make env/std
{% endblock %}

{% block build %}
make
{% endblock %}

{% block install %}
make PREFIX=${out} install
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include \${CPPFLAGS}"
export LDFLAGS="-L${out}/lib -ldl \${LDFLAGS}"
{% endblock %}
