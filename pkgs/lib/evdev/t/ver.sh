{% block pkg_name %}
libevdev
{% endblock %}

{% block version %}
1.13.5
{% endblock %}

{% block fetch %}
https://www.freedesktop.org/software/libevdev/libevdev-{{self.version().strip()}}.tar.xz
89918ae7b7c13936e6482604a77a2bfbbb74544c5d039fde01c3fa1bdf639987
{% endblock %}
