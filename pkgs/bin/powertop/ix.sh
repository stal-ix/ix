{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
powertop
{% endblock %}

{% block version %}
2.16.1
{% endblock %}

{% block fetch %}
https://github.com/fenrus75/powertop/archive/refs/tags/v{{self.version().strip()}}.tar.gz
73d5e96d992ed7f040e17c6c9130deebcf42c38990711840981c7afac6f7832f
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
(base64 -d | patch -p1) <<'EOF'
{% include 'charconv.patch.base64' %}
EOF
{% endblock %}
