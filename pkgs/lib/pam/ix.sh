{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/linux-pam/linux-pam/archive/refs/tags/v1.5.3.tar.gz
sha:631f7eb4f0356ca5b6d13e96655b2f1a57ef7cd117a0a18024891c107d25a0ca
{% endblock %}

{% block bld_tool %}
bld/flex
bld/byacc
bld/gettext
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block configure_flags %}
--disable-doc
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/include
ln -s ../include security
{% endblock %}

{% block patch %}
echo 'int main() {}' > examples/tty_conv.c
{% endblock %}
