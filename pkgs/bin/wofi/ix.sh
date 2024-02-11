{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://hg.sr.ht/~scoopta/wofi/archive/v1.4.1.tar.gz
sha:e95e35c03551c39178c16ad6213a88e3883a236e942d7f2666c780d934c270bb
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk/3
lib/wayland
lib/shim/exit
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}
