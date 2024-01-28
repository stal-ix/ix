{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/libidn/libidn2-2.3.7.tar.gz
sha:4c21a791b610b9519b9d0e12b8097bf2f359b12f8dd92647611a929e6bfd7d64
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
