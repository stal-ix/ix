{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://github.com/JuliaStrings/utf8proc/archive/refs/tags/v2.6.1.tar.gz
9fe61625c105f911a2c89423f071ef1d
{% endblock %}

{% block lib_deps %}
lib/c/mix.sh
{% endblock %}

{% block std_box %}
box/boot/mix.sh
{% endblock %}

{% block make_flags %}
SHLIB_EXT=a
SHLIB_VERS_EXT=a
{% endblock %}

{% block install %}
{{super()}}

rm ${out}/lib/lib*
cp libutf8proc.a ${out}/lib/
{% endblock %}
