{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
kbd
{% endblock %}

{% block version %}
2.9.0
{% endblock %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/linux/utils/kbd/kbd-{{self.version().strip()}}.tar.xz
fb3197f17a99eb44d22a3a1a71f755f9622dd963e66acfdea1a45120951b02ed
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
