{% extends '//die/c/make.sh' %}

{% block pkg_name %}
gnu-efi
{% endblock %}

{% block version %}
3.0.15
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/gnu-efi/gnu-efi-{{self.version().strip()}}.tar.bz2
931a257b9c5c1ba65ff519f18373c438a26825f2db7866b163e96d1b168f20ea
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block c_compiler %}
bin/gcc(for_target={{host.gnu.three}})
bin/gcc(for_target={{target.gnu.three}})
{% endblock %}

{% block make_flags %}
CC=gcc
AR=ar
ARCH=x86_64
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/efi \${CPPFLAGS}"
{% endblock %}
