{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
hwloc
{% endblock %}

{% block version %}
2.13.0
{% endblock %}

{% block fetch %}
https://download.open-mpi.org/release/hwloc/v{{self.version().strip()[:4]}}/hwloc-{{self.version().strip()}}.tar.bz2
52e936afb6ebd80f171f763fcf14f7b1f5ce98b125af5dd2f328b873b1fd0dab
{% endblock %}

{% block lib_deps %}
lib/c
lib/pci/utils
lib/pci/access
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
