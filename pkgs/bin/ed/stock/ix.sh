{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
ed
{% endblock %}

{% block version %}
1.22.5
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/ed/ed-{{self.version().strip()}}.tar.lz
56e107ddc2f29dad6690376c15bf9751509e1ee3b8241710e44edbe5c3a158cc
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/sigsegv
{% endblock %}
