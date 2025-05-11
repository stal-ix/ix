{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
m4
{% endblock %}

{% block version %}
1.4.20
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/m4/m4-{{self.version().strip()}}.tar.xz
sha:e236ea3a1ccf5f6c270b1c4bb60726f371fa49459a8eaaebc90b216b328daf2b
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/sigsegv
{% endblock %}

{% block std_box %}
{{super()}}
bld/help2man
{% endblock %}

{% block configure_flags %}
--disable-c++
{% endblock %}
