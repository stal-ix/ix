{% extends '//die/c/meson.sh' %}

{% block lib_deps %}
lib/c
lib/glib
lib/gcrypt
lib/secret
lib/p11/kit
{% endblock %}

{% block bld_tool %}
bld/gettext
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

{% block setup %}
export CPPFLAGS="-D_GNU_SOURCE=1 ${CPPFLAGS}"
{% endblock %}
