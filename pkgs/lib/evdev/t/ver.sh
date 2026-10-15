{% block pkg_name %}
libevdev
{% endblock %}

{% block version %}
1.14.0
{% endblock %}

{% block fetch %}
https://www.freedesktop.org/software/libevdev/libevdev-{{self.version().strip()}}.tar.xz
5a0966c7110648665983848bad696c7acba614a2160d2865d535397101007332
{% endblock %}
