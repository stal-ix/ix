{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libxo
{% endblock %}

{% block version %}
2.3.0
{% endblock %}

{% block fetch %}
https://github.com/Juniper/libxo/archive/refs/tags/{{self.version().strip()}}.tar.gz
f64edb672ad5445523dfa13071968ed779da25cdda4a1397789c83f5a9b36a76
{% endblock %}

{% block lib_deps %}
lib/c
lib/bsd
{% endblock %}

{% block bld_tool %}
bld/byacc
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
sed -e 's|AC_MSG_FAILURE("could not find msgfmt tool")|AC_MSG_NOTICE("could not find msgfmt tool")|' -i configure.ac
{% endblock %}
