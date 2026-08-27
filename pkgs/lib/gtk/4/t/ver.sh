{% block pkg_name %}
gtk
{% endblock %}

{% block version %}
4.22.4
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gtk/-/archive/{{self.version().strip()}}/gtk-{{self.version().strip()}}.tar.bz2
acadda507c54b7c75c1284a4e816b33c3db3e5e2acff33272af863f5b155d952
{% endblock %}
