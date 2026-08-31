{% extends '//die/c/ix.sh' %}

{% block pkg_name %}
uthash
{% endblock %}

{% block version %}
2.4.0
{% endblock %}

{% block fetch %}
https://github.com/troydhanson/uthash/archive/refs/tags/v{{self.version().strip()}}.tar.gz
387ba027946d7c64e9aa19cc53b2edcd714f8f9dca9fa8e3aaef17e0e8e3d736
{% endblock %}

{% block install %}
cp -R src ${out}/include
{% endblock %}
