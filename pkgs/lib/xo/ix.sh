{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libxo
{% endblock %}

{% block version %}
2.0.0
{% endblock %}

{% block fetch %}
https://github.com/Juniper/libxo/archive/refs/tags/{{self.version().strip()}}.tar.gz
11d1bf829051de3cffb47515d553f91e113a1eac14ac2a5a6e2ce2387f9c65f7
{% endblock %}

{% block lib_deps %}
lib/c
lib/bsd
{% endblock %}

{% block bld_libs %}
lib/bsd/overlay
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block autoreconf %}
sh bin/setup.sh
{% endblock %}

{% block patch %}
find . -type f | while read l; do
    sed -e 's|.*sys/sysctl.h.*||' -i ${l}
done
{% endblock %}
