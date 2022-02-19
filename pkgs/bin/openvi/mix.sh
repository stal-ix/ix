{% extends '//mix/make.sh' %}

{% block fetch %}
https://github.com/johnsonjh/OpenVi/archive/refs/tags/7.0.11.tar.gz
sha:d1bb1bf56bbc644ad9f95ed1b5a3ac4e46f0808a7e983f0967ca519afa7edff1
{% endblock %}

{% block bld_libs %}
lib/c
lib/curses
{% endblock %}

{% block bld_tool %}
bin/mawk
bld/perl
{% endblock %}

{% block make_flags %}
PAWK=mawk
{% endblock %}

{% block patch %}
find . -type f | while read l; do
    sed -e "s|/var/tmp|${TMPDIR}|g" \
        -e "s|/tmp/vi|vi|g" \
        -e 's|chown|echo|'  \
        -i ${l}
done
{% endblock %}
