{% extends '//bin/gcc/10/unwrap/ix.sh' %}

{% block pkg_name %}
gcc
{% endblock %}

{% block version %}
8.5.0
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/gcc/gcc-{{self.version().strip()}}/gcc-{{self.version().strip()}}.tar.xz
d308841a511bb830a6100397b0042db24ce11f642dab6ea6ee44842e5325ed50
{% endblock %}

{% block configure_flags %}
{{super()}}
--disable-libmpx
{% endblock %}
