{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
nwg-launchers
{% endblock %}

{% block version %}
0.6.3
{% endblock %}

{% block fetch %}
https://github.com/nwg-piotr/nwg-launchers/archive/refs/tags/v{{self.version().strip()}}.tar.gz
8be219ef7e8aead08b46215c9c545b1bf9d108cefee580ffcf297553dee9dfaf
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/gtk/3/mm
lib/json/nlohmann
lib/gtk/layer/shell/3
{% endblock %}

{% block patch %}
cat - common/nwg_classes.h << EOF > _
#include <array>
EOF

mv _ common/nwg_classes.h
{% endblock %}
