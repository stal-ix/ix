{% extends '//die/c/configure.sh' %}

{% block pkg_name %}
chrony
{% endblock %}

{% block version %}
4.9
{% endblock %}

{% block fetch %}
https://github.com/mlichvar/chrony/archive/refs/tags/{{self.version().strip()}}.tar.gz
897ede3eb12106ab9f8ca1dbf0c13ca3ab57606eea8b5968ce5ba7b77ee4fb50
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
