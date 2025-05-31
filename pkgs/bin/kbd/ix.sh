{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
kbd
{% endblock %}

{% block version %}
2.8.0
{% endblock %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/linux/utils/kbd/kbd-{{self.version().strip()}}.tar.xz
sha:01f5806da7d1d34f594b7b2a6ae1ab23215344cf1064e8edcd3a90fef9776a11
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block bld_libs %}
lib/c
lib/pam
lib/kernel
{% endblock %}

{% block bld_tool %}
bin/gzip
bld/flex
bld/bison
bld/gettext
{% endblock %}
