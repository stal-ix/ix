{% extends '//die/std/ix.sh' %}

{#
Build-time dependency glib-2.0 found: YES 2.78.1
atk/meson.build:89:21: ERROR: Could not get pkg-config variable and no default provided for <PkgConfigDependency glib-2.0: True None>
A full log can be found at /ix/build/YVHUFzlDNcsEmXfI/obj/meson-logs/meson-log.txt
subcommand error: [/ix/store/YVHUFzlDNcsEmXfI-lib-atk/touch sh -s] failed with exit status 1
#}

{% block fetch %}
https://github.com/mesonbuild/meson/archive/refs/tags/1.3.2.tar.gz
sha:6c4b4f35b51a260b362535fd32fee6d244871be38a2880f4de3ea9c6e69a0808
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
