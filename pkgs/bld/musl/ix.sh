{% extends '//die/c/make.sh' %}

{% block fetch %}
http://musl.libc.org/releases/musl-1.2.4.tar.gz
sha:7a35eae33d5372a7c0da1188de798726f68825513b7ae3ebe97aaaa52114f039
{% endblock %}

{% block bld_libs %}
lib/kernel
lib/compiler_rt/builtins/hack/pic
{% endblock %}

{% block configure %}
sh ./configure \
    --prefix=${out} \
    --enable-shared \
    --disable-static \
    --syslibdir=${out}/bin
{% endblock %}

{% block postinstall %}
:
{% endblock %}
