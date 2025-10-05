{% block pkg_name %}
gtk
{% endblock %}

{% block version %}
4.20.0
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gtk/-/archive/{{self.version().strip()}}/gtk-{{self.version().strip()}}.tar.bz2
896bc415d2fd098c1fa88be2f6dcbb5efaad7d74d92cb78566a8626fcef97951
{% endblock %}
