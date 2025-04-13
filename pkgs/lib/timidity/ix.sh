{% extends '//die/c/autorehell.sh' %}

{% block version %}
0.2.7
{% endblock %}

{% block fetch %}
https://sourceforge.net/projects/libtimidity/files/libtimidity/{{self.version().strip()}}/libtimidity-{{self.version().strip()}}.tar.gz
sha:26447cbc049fb262e26b640e42c063e8694133aa92ff145e0d0b15a03a352e6a
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
