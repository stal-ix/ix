{% block pkg_name %}
binutils
{% endblock %}

{% block version %}
2.45
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/binutils/binutils-{{self.version().strip()}}.tar.bz2
1393f90db70c2ebd785fb434d6127f8888c559d5eeb9c006c354b203bab3473e
{% endblock %}
