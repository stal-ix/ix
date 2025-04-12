{% extends '//bin/gdb/14/ix.sh' %}

{% block version %}
16.2
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/gdb/gdb-{{self.version().strip()}}.tar.xz
sha:4002cb7f23f45c37c790536a13a720942ce4be0402d929c9085e92f10d480119
{% endblock %}
