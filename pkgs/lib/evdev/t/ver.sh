{% block pkg_name %}
libevdev
{% endblock %}

{% block version %}
1.13.6
{% endblock %}

{% block fetch %}
https://www.freedesktop.org/software/libevdev/libevdev-{{self.version().strip()}}.tar.xz
73f215eccbd8233f414737ac06bca2687e67c44b97d2d7576091aa9718551110
{% endblock %}
