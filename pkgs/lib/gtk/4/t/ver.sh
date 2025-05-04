{% block pkg_name %}
gtk
{% endblock %}

{% block version %}
4.18.5
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gtk/-/archive/{{self.version().strip()}}/gtk-{{self.version().strip()}}.tar.bz2
sha:a6ff77ea7a12b7c337cccff88cea542364a0768c7a43d48fee0c757d4843a221
{% endblock %}
