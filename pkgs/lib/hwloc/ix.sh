{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
hwloc
{% endblock %}

{% block version %}
2.12.0
{% endblock %}

{% block fetch %}
https://download.open-mpi.org/release/hwloc/v{{self.version().strip()[:4]}}/hwloc-{{self.version().strip()}}.tar.bz2
sha:06a0a2bdc0a5714e839164683846a0e936a896213758e9d37e49e232b89c58d4
{% endblock %}

{% block lib_deps %}
lib/c
lib/pci/utils
lib/pci/access
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
