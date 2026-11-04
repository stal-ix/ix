{% extends '//die/c/make.sh' %}

{% block pkg_name %}
sndio
{% endblock %}

{% block version %}
1.11.0
{% endblock %}

{% block fetch %}
https://sndio.org/sndio-{{self.version().strip()}}.tar.gz
3e274b5968aa863090d6c6857d7df4f432cd0bafbe4d27312bdca34726eff1e8
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
    {% block configure_flags %}{% endblock %}
{% endblock %}
