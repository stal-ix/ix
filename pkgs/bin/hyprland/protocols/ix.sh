{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/hyprwm/hyprland-protocols/archive/0dcff94fc10df2bbb66d3e1b5a1d6cfd3ada5515.tar.gz
sha:bd10d74691c31f6ea02e2eb103988f1159e9cfccc9bf2d8ddb811e9bd70019f5
{% endblock %}

{% block postinstall %}
mkdir ${out}/share/hyprland-protocols
mv ${out}/share/protocols ${out}/share/hyprland-protocols/
{% endblock %}
