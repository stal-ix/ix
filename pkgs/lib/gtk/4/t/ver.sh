{% block pkg_name %}
gtk
{% endblock %}

{% block version %}
4.20.2
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gtk/-/archive/{{self.version().strip()}}/gtk-{{self.version().strip()}}.tar.bz2
c12afd5c3aaf7d639c8802c3e32be945ac8d9963d3daff6ae1353ffe9c434e39
{% endblock %}
