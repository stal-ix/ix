{% extends '//mix/make.sh' %}

{% block fetch %}
https://sndio.org/sndio-1.8.1.tar.gz
sha:f81d37189e072cb4804ac98a059d74f963f69e9945eaff3d0d6a2f98d71a6321
{% endblock %}

{% block lib_deps %}
lib/c
lib/bsd
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
sh ./configure --prefix=${out} --with-libbsd {% block configure_flags %}{% endblock %}
{% endblock %}
