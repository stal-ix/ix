{% extends '//mix/template/c_std.sh' %}

{% block fetch %}
https://www.kernel.org/pub/linux/kernel/v5.x/linux-5.13.12.tar.xz
6e1728b2021ca19cc9273f080e6c44c7
{% endblock %}

{% block host_libs %}
lib/c/no_rt/mix.sh(std_env={{std_env}})
{% endblock %}

{% block std_box %}
box/boot/mix.sh
{% endblock %}

{% block setup_tools %}
mkdir tmp; cd tmp; ln -s ${HOST_CC} gcc
export PATH="${PWD}:${PATH}"
{% endblock %}

{% block build %}
make  mrproper
make headers

find usr/include -name '.*' -delete
rm usr/include/Makefile
{% endblock %}

{% block install %}
cp -rv usr/include ${out}/
{% endblock %}

{% block env %}
export CPPFLAGS="-isystem ${out}/include \${CPPFLAGS}"
{% endblock %}
