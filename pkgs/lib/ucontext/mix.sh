{% extends '//mix/make.sh' %}

{% block fetch %}
https://github.com/kaniini/libucontext/archive/refs/tags/libucontext-1.2.tar.gz
sha:937fba9d0beebd7cf957b79979b19fe3a29bb9c4bfd25e869477d7154bbf8fd3
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block make_flags %}
INCLUDEDIR=/include
PKGCONFIGDIR=/lib/pkgconfig
DESTDIR=${out}
ARCH={{target.arch}}
FREESTANDING=yes
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block bld_tool %}
bld/bash
{% endblock %}

{% block patch %}
sed -e 's|install.*POSIX.*;|echo 1;|' -i Makefile
{% endblock %}

{% block install %}
{{super()}}
cat << EOF > ${out}/include/ucontext.h
{% include 'ucontext.h' %}
EOF
{% endblock %}
