{% extends '//die/c/meson.sh' %}

{# need to statlink plugins #}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gnome-keyring/-/archive/48.0/gnome-keyring-48.0.tar.bz2
sha:f0fb25865d13665c475cead8eb9ed6fee0780e04c7f7e8d2b3d18551b3aa0986
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

{% block meson_flags %}
systemd=disabled
manpage=false
debug-mode=false
pkcs11-modules=${out}/lib
pkcs11-config=${out}/lib
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
