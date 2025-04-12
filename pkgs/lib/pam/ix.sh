{% extends '//die/c/autorehell.sh' %}

{% block version %}
1.6.1
{% endblock %}

{% block fetch %}
{# 1.7.0 - broken meson build #}
https://github.com/linux-pam/linux-pam/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:2d7bd19782ede2a8284e1dfede70c01e81ee7bc8e05b91fe00aac85d2cc7d2c4
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
