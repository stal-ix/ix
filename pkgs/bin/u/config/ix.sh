{% extends '//die/c/ix.sh' %}

{% block fetch %}
https://github.com/skeeto/u-config/archive/refs/tags/v0.33.0.tar.gz
sha:bed099bf49625b0ec616446f037b76cef85243ef5fcd7ad07ef8fcb82f20f00d
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block build %}
cc -o pkg-config generic_main.c
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
cp pkg-config ${out}/bin/
{% endblock %}
