{% extends '//bin/zenithy/t/ix.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/zenity/-/archive/3.90.0/zenity-3.90.0.tar.bz2
sha:39b2e825b201a665f2028c4290aa485e4ef5fb499e33ebd08d38dff3a50528f9
{% endblock %}

{% block bld_libs %}
{{super()}}
lib/adwaita
{% endblock %}
