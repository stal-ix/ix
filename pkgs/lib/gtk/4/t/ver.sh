{% block pkg_name %}
gtk
{% endblock %}

{% block version %}
4.24.0
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gtk/-/archive/{{self.version().strip()}}/gtk-{{self.version().strip()}}.tar.bz2
1599be1a18944d7ead6ac869aecb5c56c9c5ae5250b895f33580cddd6ee64b6b
{% endblock %}
