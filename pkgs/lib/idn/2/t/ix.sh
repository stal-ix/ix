{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/libidn/libidn2-2.3.8.tar.gz
sha:f557911bf6171621e1f72ff35f5b1825bb35b52ed45325dcdee931e5d3c0787a
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
mv unistring old
mkdir unistring
mv old/m4 unistring/
cat << EOF > unistring/Makefile.am
noinst_LTLIBRARIES = libunistring.la
libunistring_la_SOURCES =
EOF
{% endblock %}

{% block configure %}
{{super()}}
sed -e 's|\[\[__maybe_unused__\]\]||g' -i config.h
{% endblock %}
