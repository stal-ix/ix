{% extends '//bin/gcc/10/ix.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/gcc/gcc-8.5.0/gcc-8.5.0.tar.xz
sha:d308841a511bb830a6100397b0042db24ce11f642dab6ea6ee44842e5325ed50
{% endblock %}

{% block configure_flags %}
{{super()}}
--disable-libmpx
{% endblock %}
