{% extends '//util/template.sh' %}

{% block fetch %}
# url https://www.kernel.org/pub/linux/kernel/v5.x/linux-5.13.12.tar.xz
# md5 6e1728b2021ca19cc9273f080e6c44c7
{% endblock %}

{% block deps %}
# bld boot/stage/5/env
{% endblock %}

{% block build %}
make mrproper
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
