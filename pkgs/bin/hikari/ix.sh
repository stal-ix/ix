{% extends '//die/c/make.sh' %}

{% block pkg_name %}
hikari
{% endblock %}

{% block version %}
3.0.0
{% endblock %}

{% block fetch %}
https://codeberg.org/thomasadam/hikari/archive/{{self.version().strip()}}.tar.gz
db3cb9572aa847f55a2fd51c7cb73ea6f51f956aa9a707c15d4b6d6a5b7b1d78
{% endblock %}

{% block bld_libs %}
lib/c
{% if linux %}
lib/pam
{% endif %}
lib/pango
lib/cairo
lib/input
lib/wayland
lib/xkb/common
lib/wlroots/19
lib/ucl/parser
lib/drivers/3d
{% endblock %}

{% block make_bin %}bmake{% endblock %}

{% block bld_tool %}
bld/bmake
bld/wayland
bld/pkg/config
bin/lowdown
{% endblock %}

{% block patch %}
sed -i \
    -e 's#pandoc -M title:"HIKARI(1) ${VERSION} | hikari - Wayland Compositor" -s \\#lowdown -s -t man -M title:HIKARI -M section:1 \\#' \
    -e 's#--to man -o#-M date:${VERSION} -M "source:hikari - Wayland Compositor" -o#' \
    Makefile
{% endblock %}

{% block make_flags %}
WITH_POSIX_C_SOURCE=YES
{% endblock %}
