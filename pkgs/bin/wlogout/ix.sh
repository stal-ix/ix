{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/ArtsyMacaw/wlogout/archive/refs/tags/1.2.2.tar.gz
4c9204bfa19c73f51176c94c67711f54f3e393301c0809c61ae379054060fa46
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk/3
lib/gtk/layer/shell/3
{% endblock %}

{% block bld_tool %}
bin/scdoc
bld/wayland
{% endblock %}
