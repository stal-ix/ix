{% extends '//die/make.sh' %}

{% block fetch %}
https://sndio.org/sndio-1.9.0.tar.gz
sha:f30826fc9c07e369d3924d5fcedf6a0a53c0df4ae1f5ab50fe9cf280540f699a
{% endblock %}

{% block lib_deps %}
lib/c
{% if linux %}
lib/bsd
{% endif %}
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block patch %}
find . -name Makefile.in -type f | while read l; do
    sed -e "s|-lsndio|${PWD}/libsndio/libsndio.so|" -i ${l}
done

find . -name '*.h' -type f | while read l; do
    sed -e 's|/tmp/sndio|/var/run/sndiod|' -i ${l}
done
{% endblock %}

{% block configure %}
sh ./configure \
    --prefix=${out} \
{% if linux %}
    --with-libbsd   \
{% endif %}
    {% block configure_flags %}{% endblock %}
{% endblock %}
