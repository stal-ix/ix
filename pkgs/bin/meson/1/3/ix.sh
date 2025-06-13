{% extends '//die/std/ix.sh' %}

{% block pkg_name %}
meson
{% endblock %}

{% block version %}
1.3.2
{% endblock %}

{% block fetch %}
https://github.com/mesonbuild/meson/archive/refs/tags/{{self.version().strip()}}.tar.gz
6c4b4f35b51a260b362535fd32fee6d244871be38a2880f4de3ea9c6e69a0808
{% endblock %}

{% block step_unpack %}
# spaces in paths
mkdir src
cd src
extract0 ${src}/1*
cd meson*
{% endblock %}

{% block step_patch %}
base64 -d << EOF | patch -p2
{% include '0.diff/base64' %}
EOF
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
cp -R ../meson* ${out}/bin/bin_meson
cd ${out}/bin
ln -s bin_meson/meson.py meson
{% endblock %}

{% block postinstall %}
test -f ${out}/bin/meson
{% endblock %}
