{% extends '//bin/hypr/t/ix.sh' %}

{% block fetch %}
https://github.com/pg83/hyprpaper/archive/7136d4ca42b9bad63b672307f80b83a9fcbce3c1.zip
sha:62074d88764ca2ac4dcf127ffb98559e0f463ba8ad2d8cc283abbc5e440dbeaf
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/obj/hyprpaper ${out}/bin/
{% endblock %}
