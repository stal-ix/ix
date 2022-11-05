{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/w3m/w3m/w3m-0.5.3/w3m-0.5.3.tar.gz
sha:e994d263f2fd2c22febfbe45103526e00145a7674a0fda79c822b97c2770a9e3
{% endblock %}

{% block bld_libs %}
lib/c
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
{% endblock %}
