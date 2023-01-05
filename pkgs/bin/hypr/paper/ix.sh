{% extends '//bin/hypr/t/ix.sh' %}

{% block fetch %}
https://github.com/hyprwm/hyprpaper/archive/1c19aa2b4f2b9e70dd9a3d2105f396cf094b0e82.zip
sha:fff2b116a2c81d4bd5fb4c66e4263861577ad9ed435eb4531c7964960104ede0
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/obj/hyprpaper ${out}/bin/
{% endblock %}
