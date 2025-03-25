{% extends '//die/c/autohell.sh' %}

{% block bld_libs %}
lib/c
lib/edit
lib/inih
lib/urcu
lib/kernel
lib/e2fsprogs
{% endblock %}

{% block bld_tool %}
bin/gzip
bld/bash
bld/gettext
{% endblock %}

{% block configure_flags %}
--enable-editline=yes
--enable-blkid=no
{% endblock %}

{% block make_flags %}
INSTALL=install
{% endblock %}

{% block patch %}
>install-sh
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block install %}
{{super()}}
rm -rf ${out}/lib64
{% endblock %}
