{% extends '//bin/epiphany/t/ix.sh' %}

{% block fetch %}
https://github.com/GNOME/epiphany/archive/6ce6a03e40612d4b51dd39c1f8dda2f2f3d6f520.zip
sha:525eda50e51d2ff72871a71897b093afedff62d433c742191f50698f6dc2a4f8
{% endblock %}

{% block bld_libs %}
lib/adwaita
{{super()}}
{% endblock %}
