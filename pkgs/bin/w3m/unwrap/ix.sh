{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
w3m
{% endblock %}

{% block version %}
0.5.6
{% endblock %}

{% block fetch %}
https://git.sr.ht/~rkta/w3m/archive/v{{self.version().strip()}}.tar.gz
8dd652cd3f31817d68c7263c34eeffb50118c80be19e1159bf8cbf763037095e
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/intl
lib/curses
lib/boehmgc
lib/openssl
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}

{% block patch %}
sed -e 's|.*USE_EGD.*||' -i config.h.in
sed -e 's|.*GC_set_warn_proc.*||' -i main.c
find . -type f | while read l; do
    sed -e 's|file_handle|file_handle_xxx|g' -i ${l}
done
# the shipped table is current; regenerating it trips gawk on "0xE000..F8FF"
touch libwc/map/ucs_ambwidth.map
{% endblock %}

{% block c_flags %}
-Wno-implicit-function-declaration
{% endblock %}
