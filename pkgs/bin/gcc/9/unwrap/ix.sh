{% extends '//bin/gcc/10/unwrap/ix.sh' %}

{% block version %}
9.5.0
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/gcc/gcc-{{self.version().strip()}}/gcc-{{self.version().strip()}}.tar.xz
sha:27769f64ef1d4cd5e2be8682c0c93f9887983e6cfd1a927ce5a0a2915a95cf8f
{% endblock %}
