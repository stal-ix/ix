{% extends '//die/c/make.sh' %}

{% block pkg_name %}
fzy
{% endblock %}

{% block version %}
1.1
{% endblock %}

{% block fetch %}
https://github.com/jhawthorn/fzy/archive/refs/tags/{{self.version().strip()}}.tar.gz
93d300d9c6c7063b2c6bda4e08a9704a029ec33f609718cd95443d1a890aff4e
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
