{% extends '//bin/hypr/t/ix.sh' %}

{% block fetch %}
https://github.com/hyprwm/hyprpicker/archive/refs/tags/v0.1.0.tar.gz
sha:a347e8884f08853f16765c281f37dae7ad9518e3dd998816b5ecf0a29941a010
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/obj/hyprpicker ${out}/bin/
{% endblock %}
