{% extends '//bin/zenithy/t/ix.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/zenity/-/archive/4.0.0/zenity-4.0.0.tar.bz2
sha:fdd5995f60b62c49070caeebcd7770df9f03dc83dfd839d5accb607c88b6d84d
{% endblock %}

{% block bld_libs %}
{{super()}}
lib/adwaita
{% endblock %}

{% block bld_tool %}
bld/help2man
{{super()}}
{% endblock %}
