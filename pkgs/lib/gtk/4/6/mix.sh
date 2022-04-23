{% extends '//lib/gtk/4/4/mix.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gtk/-/archive/4.6.3/gtk-4.6.3.tar.bz2
sha:b45d841c5873e70f9dcadb0e50aab7b069cc86fd2c3f901d824d3cc197421c66
{% endblock %}

{% block bld_tool %}
bin/sassc
{{super()}}
{% endblock %}
