{% extends '//die/c/premake.sh' %}

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

{% block premake_tool %}
bld/premake/boot
{% endblock %}

{% block premake_flags %}
--no-luasocket
--no-zlib
--no-curl
{% endblock %}

{% block configure %}
premake5 embed
{{super()}}
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp bin/release/premake5 ${out}/bin/
{% endblock %}
