{% extends '//die/c/configure.sh' %}

{% block pkg_name %}
chrony
{% endblock %}

{% block version %}
4.7
{% endblock %}

{% block fetch %}
https://github.com/mlichvar/chrony/archive/refs/tags/{{self.version().strip()}}.tar.gz
f0d6c81ce4e0628b00a6da7b96d8f19e95d8f9e14e51395df63723e48d64e80f
{% endblock %}

{% block bld_libs %}
lib/c
lib/cap
lib/edit
lib/kernel
lib/seccomp
lib/tom/crypt
{% endblock %}

{% block bld_tool %}
bld/bison
bld/fake/er(tool_name=asciidoctor)
{% endblock %}

{% block configure %}
{{super()}}
sed -e 's|.*mkdir.*SYSCONFDIR.*||'   \
    -e 's|.*mkdir.*CHRONYVARDIR.*||' \
    -i Makefile
{% endblock %}
