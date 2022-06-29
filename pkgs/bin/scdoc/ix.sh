{% extends '//die/make.sh' %}

{% block fetch %}
https://git.sr.ht/~sircmpwn/scdoc/archive/1.11.2.tar.gz
md5:0f6e8b9bb741f52d975081784757078b
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
