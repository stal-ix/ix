{% extends '//bin/zenithy/t/ix.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/zenity/-/archive/4.0.1/zenity-4.0.1.tar.bz2
sha:da5c9433fff301bb8e34e4c61846b9e4932152e16222b43f67e0c5cef3251571
{% endblock %}

{% block bld_libs %}
{{super()}}
lib/adwaita
{% endblock %}

{% block bld_tool %}
bld/help2man
{{super()}}
{% endblock %}
