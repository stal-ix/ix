{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/Juniper/libxo/archive/refs/tags/1.7.3.tar.gz
sha:3fddffd39ae5abee610dbee3a17f91437f24ad38fd84710a7b1147f6ff165dda
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
