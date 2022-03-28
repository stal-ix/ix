{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://www.lysator.liu.se/~nisse/misc/argp-standalone-1.3.tar.gz
720704bac078d067111b32444e24ba69
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block patch %}
patch -p0 << EOF
{% include 'patch-argp-fmtstream.h' %}
EOF
{% endblock %}

{% block install %}
mkdir ${out}/lib ${out}/include
cp libargp.a ${out}/lib
cp argp.h ${out}/include
{% endblock %}
