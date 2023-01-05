{% extends '//bin/epiphany/t/ix.sh' %}

{% block fetch %}
https://github.com/GNOME/epiphany/archive/88f50d97824ce0595a6f0a6af8ab50437e92d8ed.zip
sha:645d8f43e97d00225d4d32bf1c4b212784d69c2810ab5854c156afea80c95103
{% endblock %}

{% block bld_libs %}
lib/adwaita
lib/mesa/glesv2/dl
{{super()}}
{% endblock %}
