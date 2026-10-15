{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
gnome-keyring
{% endblock %}

{% block version %}
51.1
{% endblock %}

{# need to statlink plugins #}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gnome-keyring/-/archive/{{self.version().strip()}}/gnome-keyring-{{self.version().strip()}}.tar.bz2
b39a070407944370b8bb24c3610aea211fbb4a4aa8c182424054feca532c8cfd
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
