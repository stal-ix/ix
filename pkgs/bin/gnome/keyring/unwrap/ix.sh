{% extends '//die/c/autorehell.sh' %}

{# need to statlink plugins #}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gnome-keyring/-/archive/46.1/gnome-keyring-46.1.tar.bz2
sha:4bafb5af5859cb4aa6b9e95ee0cca9762139535e1f1bf896d69180c9bf2d6519
{% endblock %}

{% block bld_libs %}
lib/c
lib/pam
lib/gcr
lib/glib
lib/gcrypt
lib/secret
{% endblock %}

{% block bld_tool %}
bld/glib
bld/gettext
{% endblock %}

{% block configure_flags %}
--disable-doc
--without-systemd
{% endblock %}

{% block setup_target_flags %}
export GLIB_COMPILE_SCHEMAS=glib-compile-schemas
{% endblock %}

{% block make_flags %}
P11_MODULE_PATH=${out}/lib
P11_SYSTEM_CONFIG_MODULES=${out}/lib
{% endblock %}

{% block patch %}
find ./egg/ -type f -name '*.c' | grep egg- | grep -v egg-cleanup | while read l; do
    echo > ${l}
done
find ./ -type f -name '*.c' | grep test- | while read l; do
    echo 'int main() {}' > ${l}
done
{% endblock %}

{% block c_rename_symbol %}
SECMEM_pool_data_v1_0
{% endblock %}
