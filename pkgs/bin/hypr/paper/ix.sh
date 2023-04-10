{% extends '//bin/hypr/t/ix.sh' %}

{% block fetch %}
https://github.com/hyprwm/hyprpaper/archive/refs/tags/v0.2.0.tar.gz
sha:20c71db247c54480f5187b77b2b24cb11ec4c53ee599bd7d777f1fccdb344b5f
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/obj/hyprpaper ${out}/bin/
{% endblock %}
