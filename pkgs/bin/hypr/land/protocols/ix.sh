{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/hyprwm/hyprland-protocols/archive/301733ae466b229066ba15a53e6d8b91c5dcef5b.tar.gz
sha:726d39b5c9ce48d895a18ac69dd375dbd126d1cb209b7aa0300badfa3d679350
{% endblock %}

{% block postinstall %}
mkdir ${out}/share/hyprland-protocols
mv ${out}/share/protocols ${out}/share/hyprland-protocols/
{% endblock %}
