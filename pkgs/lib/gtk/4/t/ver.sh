{% block pkg_name %}
gtk
{% endblock %}

{% block version %}
4.20.3
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gtk/-/archive/{{self.version().strip()}}/gtk-{{self.version().strip()}}.tar.bz2
ee9d76f11a8cd2c0048ad1ad1a1cf1d8fcb4f5c96283369f0daccee7e487596e
{% endblock %}
