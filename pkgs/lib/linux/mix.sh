{% extends '//mix/template/c_std.sh' %}

{% block fetch %}
https://www.kernel.org/pub/linux/kernel/v5.x/linux-5.13.12.tar.xz
6e1728b2021ca19cc9273f080e6c44c7
{% endblock %}

{% block host_libs %}
lib/musl/pure(std_env={{std_env}})
{% endblock %}

{% block std_box %}
bld/bootbox
{% endblock %}

{% block setup_tools %}
ln -s ${HOST_CC} gcc
{% endblock %}

{% block build %}
make HOST_CC=gcc mrproper
make headers

find usr/include -name '.*' -delete
rm usr/include/Makefile
{% endblock %}

{% block install %}
cp -rv usr/include ${out}/
{% endblock %}

{% block env_lib %}
export CPPFLAGS="-isystem ${out}/include \${CPPFLAGS}"
{% endblock %}
