{% extends '//die/c/gnome.sh' %}

{% block version %}
48.0
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/d-spy/-/archive/{{self.version().strip()}}/d-spy-{{self.version().strip()}}.tar.bz2
sha:ea985ac78980b0664464ce94f01ef2375e2829f0d0c3018ceca1dfa53de371d8
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk
lib/glib
lib/adwaita
{% endblock %}
