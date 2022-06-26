{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/libidn/libidn2-2.3.2.tar.gz
sha:76940cd4e778e8093579a9d195b25fff5e936e9dc6242068528b437a76764f91
{% endblock %}

{% block lib_deps %}
lib/c
lib/iconv
lib/unistring
{% endblock %}

{% block c_rename_symbol %}
error
{% endblock %}

{% block bld_tool %}
bld/gettext
bld/texinfo
bld/help2man
{% endblock %}

{% block env_lib %}
export COFLAGS="--with-libidn2=${out} \${COFLAGS}"
{% endblock %}

{% block patch %}
find . -type f -name '*.c' | while read l; do
    sed -e 's|ifdef HAVE_SYMVER|if qw|' -i ${l}
done
{% endblock %}
