{% extends '//bin/gdb/t/ix.sh' %}

{% block host_libs %}
lib/c
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's| = { 0 }||' -i gdb/aarch64-linux-nat.c
{% endblock %}
