{% extends '//die/c/meson.sh' %}

{% block fetch %}
#https://github.com/hyprwm/hyprland-protocols/archive/0dcff94fc10df2bbb66d3e1b5a1d6cfd3ada5515.tar.gz
#sha:bd10d74691c31f6ea02e2eb103988f1159e9cfccc9bf2d8ddb811e9bd70019f5
https://github.com/hyprwm/hyprland-protocols/archive/301733ae466b229066ba15a53e6d8b91c5dcef5b.tar.gz
sha:726d39b5c9ce48d895a18ac69dd375dbd126d1cb209b7aa0300badfa3d679350
{% endblock %}

{% block postinstall %}
mkdir ${out}/share/hyprland-protocols
mv ${out}/share/protocols ${out}/share/hyprland-protocols/
{% endblock %}
