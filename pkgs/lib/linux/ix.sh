{% extends '//die/c_std.sh' %}

{% block fetch %}
https://www.kernel.org/pub/linux/kernel/v5.x/linux-5.13.12.tar.xz
sha:28b15d248f7a926e47b7218a503b9b20b6ef9ec51232603aa2163fc17ee08824
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
