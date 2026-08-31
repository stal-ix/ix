{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
powertop
{% endblock %}

{% block version %}
2.16
{% endblock %}

{% block fetch %}
https://github.com/fenrus75/powertop/archive/refs/tags/v{{self.version().strip()}}.tar.gz
cf37e565b958a64f1e3086daeab82d7959566a372d01d40d3904cbca95cdf3d2
{% endblock %}

{% block bld_libs %}
lib/c
lib/nl
lib/kernel
lib/curses
lib/pci/utils
lib/trace/fs
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}

{% block patch %}
(base64 -d | patch -p1) <<'EOF'
{% include 'chrono.patch.base64' %}
EOF
{% endblock %}
