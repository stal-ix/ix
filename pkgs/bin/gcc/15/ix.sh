{% extends '//bin/gcc/13/unwrap/ix.sh' %}

{% block pkg_name %}
gcc
{% endblock %}

{% block version %}
15.1.0
{% endblock %}

{% block fetch %}
http://ftp.gnu.org/gnu/gcc/gcc-{{self.version().strip()}}/gcc-{{self.version().strip()}}.tar.xz
sha:e2b09ec21660f01fecffb715e0120265216943f038d0e48a9868713e54f06cea
{% endblock %}
