{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://hg.sr.ht/~scoopta/wofi/archive/v1.4.tar.gz
sha:0c1190164ed80fbaae747d74a2a3c980e9f92d12f594c961596a7025822112d6
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk/3
lib/wayland
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}

{% block patch %}
sed -e 's|.*on_exit(.*||' -i src/wofi.c
{% endblock %}
