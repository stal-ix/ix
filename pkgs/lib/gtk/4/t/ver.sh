{% block pkg_name %}
gtk
{% endblock %}

{% block version %}
4.18.6
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gtk/-/archive/{{self.version().strip()}}/gtk-{{self.version().strip()}}.tar.bz2
f1e94b13c998bc656efc535404821c57c5259e8cc4f3ff8b9262459521b8087f
{% endblock %}
