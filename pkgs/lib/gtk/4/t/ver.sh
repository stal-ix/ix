{% block pkg_name %}
gtk
{% endblock %}

{% block version %}
4.24.1
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gtk/-/archive/{{self.version().strip()}}/gtk-{{self.version().strip()}}.tar.bz2
e9d2bf78745e34ba7f1f7d9421947e7e31822faa06722b1dc1a36a2d78331e30
{% endblock %}
