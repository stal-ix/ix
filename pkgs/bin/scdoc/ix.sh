{% extends '//die/c/make.sh' %}

{% block version %}
1.11.4
{% endblock %}

{% block pkg_name %}
scdoc
{% endblock %}

{% block fetch %}
https://git.sr.ht/~sircmpwn/scdoc/archive/{{self.version().strip()}}.tar.gz
e1a9c2000f855123a1a50c8f897073e0ee95fc41787431efe3864c2f1c2e7092
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
