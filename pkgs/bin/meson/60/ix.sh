{% extends '//die/std/ix.sh' %}

{% block fetch %}
https://github.com/mesonbuild/meson/archive/refs/tags/0.60.2.tar.gz
sha:fc7c2f315b5b63fee0414b0b94b5a7d0e9c71c8c9bb8487314eb5a9a33984b8d
{% endblock %}

{% block unpack %}
# spaces in paths
mkdir src; cd src; extract0 ${src}/0*; cd meson*
{% endblock %}

{% block patch %}
patch -p1 << EOF
{% include '0.diff' %}
EOF
{% endblock %}

{% block build %}
ln -s meson.py meson
{% endblock %}

{% block install %}
cp -R ../meson* ${out}/bin
{% endblock %}

{% block strip_pc %}
{% endblock %}

{% block purge_dynlib %}
{% endblock %}
