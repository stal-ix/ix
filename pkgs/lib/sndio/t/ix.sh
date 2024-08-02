{% extends '//die/c/make.sh' %}

{% block fetch %}
https://sndio.org/sndio-1.10.0.tar.gz
sha:bebd3bfd01c50c9376cf3e7814b9379bed9e17d0393b5113b7eb7a3d0d038c54
{% endblock %}

{% block lib_deps %}
lib/c
lib/bsd
{% endblock %}

{% block patch %}
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
