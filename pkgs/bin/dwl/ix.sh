{% extends '//die/c/make.sh' %}

{% block version %}
0.9
{% endblock %}

{% block pkg_name %}
dwl
{% endblock %}

{% block fetch %}
https://codeberg.org/dwl/dwl/archive/v{{self.version().strip()}}.tar.gz
635c1c352c32f2e69d7acf95053ed6178e8614b51485f221bae78255b0bf3e3d
{% endblock %}

{% block patch %}
sed -i 's/input_method_relay_create()/input_method_relay_create(void)/' ime.h
{% endblock %}

{% block bld_libs %}
lib/c
lib/wayland
lib/wlroots/20
lib/drivers/3d
{% endblock %}

{% block bld_tool %}
bld/pkg/config
bld/wayland
{% endblock %}
