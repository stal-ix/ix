{% extends '//lib/gtk/4/4/mix.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gtk/-/archive/4.6.2/gtk-4.6.2.tar.bz2
sha:fa2af70198687a71386aa21d29676e8c63453799f4a9c8f8d4c750cf496bca61
{% endblock %}

{% block bld_tool %}
lib/sass/c
{{super()}}
{% endblock %}
