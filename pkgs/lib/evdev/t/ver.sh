{% block pkg_name %}
libevdev
{% endblock %}

{% block version %}
1.13.7
{% endblock %}

{% block fetch %}
https://www.freedesktop.org/software/libevdev/libevdev-{{self.version().strip()}}.tar.xz
0caf824971108f15bb2ad356433bae198d7d3bf1e82d43f63626e069e060bfa6
{% endblock %}
