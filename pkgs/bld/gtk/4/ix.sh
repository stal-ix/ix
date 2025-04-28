{% extends '//die/c/ix.sh' %}

{% include '//lib/gtk/4/t/ver.sh' %}

{% block bld_libs %}
lib/c
lib/gtk/4
{% endblock %}

{% block patch %}
sed -e 's|.*GETTEXT_PACKAGE.*||' -i tools/updateiconcache.c
cat << EOF > tools/config.h
#pragma once
#define HAVE_UNISTD_H 1
EOF
{% endblock %}

{% block build %}
cc -o gtk4-update-icon-cache -Igtk tools/updateiconcache.c
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gtk4-update-icon-cache ${out}/bin/
{% endblock %}
