{% extends '//die/c/configure.sh' %}

{% block fetch %}
https://gitlab.com/chrony/chrony/-/archive/4.6/chrony-4.6.tar.bz2
sha:c6d13f555f8e59735190588bbe86ca4ef9fc770da6695f2ffed491128f6d9118
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
