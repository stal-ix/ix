{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
mpdecimal
{% endblock %}

{% block version %}
4.0.1
{% endblock %}

{% block fetch %}
https://www.bytereef.org/software/mpdecimal/releases/mpdecimal-{{self.version().strip()}}.tar.gz
96d33abb4bb0070c7be0fed4246cd38416188325f820468214471938545b1ac8
{% endblock %}

{% block configure_flags %}
--enable-cxx=no
{% endblock %}

{% block env %}
export COFLAGS="--with-system-libmpdec=yes --with-libmpdec-prefix=${out} \${COFLAGS}"
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
