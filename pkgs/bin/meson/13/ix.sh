{% extends '//bin/meson/100/ix.sh' %}

{#
Build-time dependency glib-2.0 found: YES 2.78.1
atk/meson.build:89:21: ERROR: Could not get pkg-config variable and no default provided for <PkgConfigDependency glib-2.0: True None>
A full log can be found at /ix/build/YVHUFzlDNcsEmXfI/obj/meson-logs/meson-log.txt
subcommand error: [/ix/store/YVHUFzlDNcsEmXfI-lib-atk/touch sh -s] failed with exit status 1
#}

{% block fetch %}
https://github.com/mesonbuild/meson/archive/refs/tags/1.3.0.tar.gz
sha:6c4b4f35b51a260b362535fd32fee6d244871be38a2880f4de3ea9c6e69a0808
{% endblock %}
