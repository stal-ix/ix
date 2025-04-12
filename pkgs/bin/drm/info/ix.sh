{% extends '//die/c/meson.sh' %}

{% block version %}
2.3.0
{% endblock %}

{% block fetch %}
https://github.com/ascent12/drm_info/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:cb7e060f8f3e444cfbeb56480ad991ab13cc13bf43af6fbff576ffa54746500c
{% endblock %}

{% block bld_libs %}
lib/c
lib/drm
lib/json/c
lib/pci/utils
{% endblock %}
