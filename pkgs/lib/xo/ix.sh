{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libxo
{% endblock %}

{% block version %}
1.7.5
{% endblock %}

{% block fetch %}
https://github.com/Juniper/libxo/archive/refs/tags/{{self.version().strip()}}.tar.gz
a4d3bd1cbbbfe7de6dad7a7e6f87757f9881753eb32d6ce6894e00e6eb28f841
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
