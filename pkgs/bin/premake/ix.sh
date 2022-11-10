{% extends '//die/c/premake.sh' %}

{% block fetch %}
{% include '//bld/premake/boot/ver.sh' %}
{% endblock %}

{% block bld_libs %}
lib/c
lib/linux/util
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block premake_flags %}
--no-luasocket
{% endblock %}

{% block configure %}
premake5 embed
{{super()}}
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp bin/release/premake5 ${out}/bin/
{% endblock %}
