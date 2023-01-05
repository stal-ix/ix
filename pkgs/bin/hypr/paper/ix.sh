{% extends '//bin/hypr/t/ix.sh' %}

{% block fetch %}
#https://github.com/hyprwm/hyprpaper/archive/1c19aa2b4f2b9e70dd9a3d2105f396cf094b0e82.zip
#sha:fff2b116a2c81d4bd5fb4c66e4263861577ad9ed435eb4531c7964960104ede0
#https://github.com/hyprwm/hyprpaper/archive/923a7909d9b78dbf396cfab3d638c5e7e8f6df11.zip
#sha:2cda1cf5877804c5ec79b3565ea40e0a068b29b95a504c13bedb31e4057bc783
https://github.com/pg83/hyprpaper/archive/7136d4ca42b9bad63b672307f80b83a9fcbce3c1.zip
sha:62074d88764ca2ac4dcf127ffb98559e0f463ba8ad2d8cc283abbc5e440dbeaf
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/obj/hyprpaper ${out}/bin/
{% endblock %}
