{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
libsigsegv
{% endblock %}

{% block version %}
2.15
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/libsigsegv/libsigsegv-{{self.version().strip()}}.tar.gz
036855660225cb3817a190fc00e6764ce7836051bacb48d35e26444b8c1729d9
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block env %}
export COFLAGS="--with-libsigsegv --with-libsigsegv-prefix=${out} \${COFLAGS}"
{% endblock %}
