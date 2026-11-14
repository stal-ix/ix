{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
libsigsegv
{% endblock %}

{% block version %}
2.16
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/libsigsegv/libsigsegv-{{self.version().strip()}}.tar.gz
f8b2fac06c091fc29d6474733d118dc163ed7cd6be4783240d31ad7af11efa30
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block env %}
export COFLAGS="--with-libsigsegv --with-libsigsegv-prefix=${out} \${COFLAGS}"
{% endblock %}
