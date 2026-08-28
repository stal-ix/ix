{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
hwloc
{% endblock %}

{% block version %}
2.14.0
{% endblock %}

{% block fetch %}
https://download.open-mpi.org/release/hwloc/v{{self.version().strip()[:4]}}/hwloc-{{self.version().strip()}}.tar.bz2
966b9bb3e9f29f8d65ce8d106779e457f40e246a645e584b100772a42f9ae94b
{% endblock %}

{% block lib_deps %}
lib/c
lib/pci/utils
lib/pci/access
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
