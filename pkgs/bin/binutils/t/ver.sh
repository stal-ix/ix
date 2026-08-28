{% block pkg_name %}
binutils
{% endblock %}

{% block version %}
2.47
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/binutils/binutils-{{self.version().strip()}}.tar.bz2
3068128c75cda9f898ccb4211d360246e8e195ffcc9dfb655b23ae23a54800e8
{% endblock %}
