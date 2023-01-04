{% extends '//bin/hypr/t/ix.sh' %}

{% block fetch %}
https://github.com/hyprwm/hyprpaper/archive/c68cc7b926cf2d24c1e7b6c2ce13495367d80736.zip
sha:3bead62fb11869d0ef43ab71f3720c9da33cb5b79afea89e5f488379ade0ec91
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/replace
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/obj/hyprpaper ${out}/bin/
{% endblock %}

{% block patch %}
{{super()}}
replace 'auto it' '[&](const std::uniqu' '[wt = wt, &m](const std::uniqu' src/Hyprpaper.cpp
replace 'No' 'onfigPath);' 'onfigPath.c_str());' src/config/ConfigManager.cpp
{% endblock %}
