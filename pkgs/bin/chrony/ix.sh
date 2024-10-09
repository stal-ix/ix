{% extends '//die/c/configure.sh' %}

{% block fetch %}
https://github.com/mlichvar/chrony/archive/refs/tags/4.6.1.tar.gz
sha:5eda8cf417db1a6b6098e9c72b9cf896468c4f5a84dd5b3171712ec240197312
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
