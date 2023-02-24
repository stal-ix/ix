{% extends '//bin/meson/64/ix.sh' %}

{% block unpack %}
# spaces in paths
mkdir src; cd src; extract0 ${src}/1*; cd meson*
{% endblock %}

{% block fetch %}
https://github.com/mesonbuild/meson/archive/refs/tags/1.0.1.tar.gz
sha:4ab3a5c0060dc22bdefb04507efc6c38acb910e91bcd467a38e1fa211e5a6cfe
{% endblock %}

{% block test %}
test -f ${out}/bin/meson
{% endblock %}
