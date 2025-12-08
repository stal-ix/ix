{% extends 't/ix.sh' %}

{% block configure_flags %}
{{super()}}
--with-libsigsegv
{% endblock %}

{% block configure %}
{{super()}}
# pthread rwlock broken on aarch64
cat << EOF > tests/Makefile
all:
install:
EOF
{% endblock %}
