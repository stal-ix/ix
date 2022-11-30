{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/libidn/libidn2-2.3.3.tar.gz
sha:f3ac987522c00d33d44b323cae424e2cffcb4c63c6aa6cd1376edacbf1c36eb0
{% endblock %}

{% block lib_deps %}
lib/c
lib/iconv
lib/unistring
{% endblock %}

{% block c_rename_symbol %}
error
rawmemchr
{% endblock %}

{% block bld_tool %}
bld/gettext
bld/texinfo
bld/help2man
{% endblock %}

{% block patch %}
find . -type f -name '*.in.h' | while read l; do
    sed -e 's|@GNULIBHEADERS_OVERRIDE_WINT_T@|0|g' -i ${l}
done
{% endblock %}
