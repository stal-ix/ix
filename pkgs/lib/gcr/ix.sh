{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gcr/-/archive/3.41.1/gcr-3.41.1.tar.bz2
sha:7e06e86e12aadaac6a72f2ee7eeaaaa6228a0ba3b92cadd50b45c0f05f0d91c6
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/gtk/3
lib/gcrypt
lib/secret
lib/p11/kit
{% endblock %}

{% block bld_tool %}
bld/glib/codegen
{% endblock %}

{% block meson_flags %}
gpg_path=gpg
gtk_doc=false
ssh_agent=false
introspection=false
{% endblock %}

{% block patch %}
cat << EOF > meson_post_install.py
#!$(which sh)
EOF
{% endblock %}

{% block setup_tools %}
>ssh-add
>ssh-agent

chmod +x ssh-add ssh-agent
{% endblock %}
