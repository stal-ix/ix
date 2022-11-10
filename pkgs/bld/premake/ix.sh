{% extends '//die/c/make.sh' %}

{% block fetch %}
{% include 'boot/ver.sh' %}
{% endblock %}

{% block bld_libs %}
lib/c
lib/linux/util
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block bld_tool %}
bld/premake/boot
{% endblock %}

{% block configure %}
premake5 embed
premake5 --no-luasocket --no-zlib --no-curl gmake2
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp bin/release/premake5 ${out}/bin/
{% endblock %}
