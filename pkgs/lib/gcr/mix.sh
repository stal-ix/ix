{% extends '//mix/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gcr/-/archive/3.41.0/gcr-3.41.0.tar.bz2
sha:cac182dadc47f95b7d83f4b0712d168c8f35de81c3c20c9f972edcbdf95b3328
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/gcrypt
lib/secret
lib/p11/kit
{% endblock %}

{% block bld_libs %}
{% if bin %}
lib/gtk/3
{% endif %}
{% endblock %}

{% block bld_tool %}
bin/glib/codegen
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
