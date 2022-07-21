{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://sourceforge.net/projects/libtimidity/files/libtimidity/0.2.7/libtimidity-0.2.7.tar.gz
sha:26447cbc049fb262e26b640e42c063e8694133aa92ff145e0d0b15a03a352e6a
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
