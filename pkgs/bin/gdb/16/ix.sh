{% extends '//bin/gdb/14/ix.sh' %}

{% block pkg_name %}
gdb
{% endblock %}

{% block version %}
16.3
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/gdb/gdb-{{self.version().strip()}}.tar.xz
sha:bcfcd095528a987917acf9fff3f1672181694926cc18d609c99d0042c00224c5
{% endblock %}
