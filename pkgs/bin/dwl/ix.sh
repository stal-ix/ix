{% extends '//die/c/make.sh' %}

{% block version %}
0.8
{% endblock %}

{% block pkg_name %}
dwl
{% endblock %}

{% block fetch %}
https://codeberg.org/dwl/dwl/archive/v{{self.version().strip()}}.tar.gz
3080087e7f613bf6a350934231fd9ed478d04cd2a2f30da8a96cdf2066f59412
{% endblock %}

{% block bld_libs %}
lib/c
lib/wayland
lib/wlroots/19
lib/drivers/3d
{% endblock %}

{% block bld_tool %}
bld/pkg/config
bld/wayland
{% endblock %}
