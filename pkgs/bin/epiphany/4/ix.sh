{% extends '//bin/epiphany/t/ix.sh' %}

{% block fetch %}
#https://github.com/GNOME/epiphany/archive/2340606e6c2ac65e9b73e57e9a277b86a1f6bc1d.zip
#sha:683657e9ee2bdaa115eaf7b23de26444d1e6809c55a831813ffdee91439e0846
https://github.com/GNOME/epiphany/archive/6ce6a03e40612d4b51dd39c1f8dda2f2f3d6f520.zip
sha:525eda50e51d2ff72871a71897b093afedff62d433c742191f50698f6dc2a4f8
{% endblock %}

{% block bld_libs %}
lib/adwaita
{{super()}}
{% endblock %}
