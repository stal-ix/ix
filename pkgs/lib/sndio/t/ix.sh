{% extends '//die/c/make.sh' %}

{% block pkg_name %}
sndio
{% endblock %}

{% block version %}
1.10.0
{% endblock %}

{% block fetch %}
https://sndio.org/sndio-{{self.version().strip()}}.tar.gz
bebd3bfd01c50c9376cf3e7814b9379bed9e17d0393b5113b7eb7a3d0d038c54
{% endblock %}

{% block lib_deps %}
lib/c
lib/bsd
{% endblock %}

{% block patch %}
{% if stalix %}
find . -name '*.h' -type f | while read l; do
    sed -e 's|/tmp/sndio|/var/run/sndiod|' -i ${l}
done
{% else %}
:
{% endif %}
{% endblock %}

{% block configure %}
sh ./configure \
    --prefix=${out} \
{% if linux %}
    --with-libbsd   \
{% endif %}
    {% block configure_flags %}{% endblock %}
{% endblock %}
