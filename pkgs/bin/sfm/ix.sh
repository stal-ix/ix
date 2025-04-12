{% extends '//die/c/make.sh' %}

{% block version %}
0.4
{% endblock %}

{% block fetch %}
https://github.com/afify/sfm/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:c0fe7f36a4050256b68c6e6c5cb3b7065527c6a8f6a1b0ca020814a7d511c652
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
