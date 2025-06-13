{% extends '//die/c/meson.sh' %}

{% block version %}
1.0_beta16
{% endblock %}

{% block pkg_name %}
sfwbar
{% endblock %}

{% block fetch %}
https://github.com/LBCrion/sfwbar/archive/refs/tags/v{{self.version().strip()}}.tar.gz
238d6394650dfdfc2f36374ec25702bbef57e2cff1d9a149ecb9a52f887c3cdf
{% endblock %}

{% block bld_libs %}
lib/c
lib/glib
lib/gtk/3
lib/json/c
lib/kernel
lib/gtk/layer/shell/3
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}
