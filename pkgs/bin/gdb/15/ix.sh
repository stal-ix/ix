{% extends '//bin/gdb/14/ix.sh' %}

{% block pkg_name %}
gdb
{% endblock %}

{% block version %}
15.2
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/gdb/gdb-{{self.version().strip()}}.tar.xz
sha:83350ccd35b5b5a0cba6b334c41294ea968158c573940904f00b92f76345314d
{% endblock %}
