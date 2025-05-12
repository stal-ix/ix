{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
hwloc
{% endblock %}

{% block version %}
2.12.1
{% endblock %}

{% block fetch %}
https://download.open-mpi.org/release/hwloc/v{{self.version().strip()[:4]}}/hwloc-{{self.version().strip()}}.tar.bz2
sha:38a90328bb86259f9bb2fe1dc57fd841e111d1e6358012bef23dfd95d21dc66b
{% endblock %}

{% block lib_deps %}
lib/c
lib/pci/utils
lib/pci/access
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
