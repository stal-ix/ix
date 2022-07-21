{% extends '//die/c/make.sh' %}

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

{% block make_target %}
libucontext.a
libucontext.pc
{% endblock %}

{% block make_install_target %}
install_static
{% endblock %}

{% block patch %}
base64 -d << EOF >> Makefile
{% include 'Makefile/base64' %}
EOF
{% endblock %}
