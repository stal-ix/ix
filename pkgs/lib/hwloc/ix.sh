{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
hwloc
{% endblock %}

{% block version %}
2.12.2
{% endblock %}

{% block fetch %}
https://download.open-mpi.org/release/hwloc/v{{self.version().strip()[:4]}}/hwloc-{{self.version().strip()}}.tar.bz2
563e61d70febb514138af0fac36b97621e01a4aacbca07b86e7bd95b85055ba0
{% endblock %}

{% block lib_deps %}
lib/c
lib/pci/utils
lib/pci/access
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
