{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/libidn/libidn2-2.3.4.tar.gz
sha:93caba72b4e051d1f8d4f5a076ab63c99b77faee019b72b9783b267986dbb45f
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
