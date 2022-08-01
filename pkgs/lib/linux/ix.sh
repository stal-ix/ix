{% extends '//die/c/ix.sh' %}

{% block fetch %}
https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.18.14.tar.xz
sha:e17d46451133d3a3099b09e200839e875100b48403171923ab71b6a9b39856af
{% endblock %}

{% block host_libs %}
# need proper flag inheritance
lib/musl/pure(std_env={{std_env}},std_box={{std_box}})
{% endblock %}

{% block std_box %}
bld/make
{{super()}}
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
