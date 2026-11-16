{% extends '//die/c/gnome.sh' %}

{% block pkg_name %}
file-roller
{% endblock %}

{% block version %}
44.8
{% endblock %}

{% block fetch %}
https://github.com/GNOME/file-roller/archive/refs/tags/{{self.version().strip()}}.tar.gz
86b642995bbc91e08b9a9416def85e6b85c74998510e5ac9bc0e3a91e48af3ee
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk
lib/glib
lib/portal
lib/adwaita
lib/archive
lib/gtk/deps
{% endblock %}

{% block bld_tool %}
bld/fake/er(tool_name=itstool)
{% endblock %}

{% block patch %}
sed -e 's|.*subdir.*help.*||' -i meson.build
{% endblock %}
