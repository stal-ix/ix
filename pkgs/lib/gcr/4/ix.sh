{% extends '//lib/gcr/t/ix.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gcr/-/archive/4.0.0/gcr-4.0.0.tar.bz2
sha:e33e5daae4715a4701a37c05775ea4ab6da17cb005adedf617f3b367be018e4b
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/gtk/4
{% endblock %}

{% block meson_flags %}
vapi=false
{{super()}}
{% endblock %}
