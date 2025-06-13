{% extends '//bin/bash/5/t/ix.sh' %}

{% block pkg_name %}
bash
{% endblock %}

{% block version %}
5.1.16
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/bash/bash-{{self.version().strip()}}.tar.gz
5bac17218d3911834520dad13cd1f85ab944e1c09ae1aba55906be1f8192f558
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block host_libs %}
lib/c(std_box={{std_box}})
{% endblock %}

{% block std_box %}
{{super()}}
bld/bison
{% endblock %}

{% block configure_flags %}
{{super()}}
--disable-nls
--disable-readline
{% endblock %}

{% block configure %}
{{super()}}
cat << EOF > examples/loadables/Makefile
all:
install:
EOF
{% endblock %}
