{% extends '//lib/firmware/ix.sh' %}

{% block pkg_name %}
linux-firmware
{% endblock %}

{% block version %}
20240312
{% endblock %}

{% block fetch %}
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/snapshot/linux-firmware-{{self.version().strip()}}.tar.gz
sha:89cbac35d1bd21ebf64936d764ccd01d4e0b6cde973e3b940f8ad2bac9086ec8
{% endblock %}
