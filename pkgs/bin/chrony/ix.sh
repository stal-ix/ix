{% extends '//die/c/configure.sh' %}

{% block pkg_name %}
chrony
{% endblock %}

{% block version %}
4.8
{% endblock %}

{% block fetch %}
https://github.com/mlichvar/chrony/archive/refs/tags/{{self.version().strip()}}.tar.gz
21ca27feeef5009fbb3e170d0884a5fbcad248826608256a7e3bca43cd7cd1eb
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
