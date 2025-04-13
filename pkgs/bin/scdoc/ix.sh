{% extends '//die/c/make.sh' %}

{% block version %}
1.11.3
{% endblock %}

{% block fetch %}
https://git.sr.ht/~sircmpwn/scdoc/archive/{{self.version().strip()}}.tar.gz
sha:4c5c6136540384e5455b250f768e7ca11b03fdba1a8efc2341ee0f1111e57612
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
