{% block pkg_name %}
gtk
{% endblock %}

{% block version %}
4.18.4
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gtk/-/archive/{{self.version().strip()}}/gtk-{{self.version().strip()}}.tar.bz2
sha:f729b207846f60be969c27a8b15a977e8ae7d288105f50db42a3496d68204843
{% endblock %}
