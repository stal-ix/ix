{% extends '//bin/meson/64/ix.sh' %}

{% block unpack %}
# spaces in paths
mkdir src; cd src; extract0 ${src}/1*; cd meson*
{% endblock %}

{% block fetch %}
https://github.com/mesonbuild/meson/archive/refs/tags/1.0.0.tar.gz
sha:a2ada84d43c7e57400daee80a880a1f5003d062b2cb6c9be1747b0db38f2eb8d
{% endblock %}

{% block test %}
test -f ${out}/bin/meson
{% endblock %}
