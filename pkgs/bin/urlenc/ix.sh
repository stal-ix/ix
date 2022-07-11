{% extends '//die/make.sh' %}

{% block fetch %}
https://github.com/M1cR0xf7/urlenc/archive/a94b189b9a224816b14dbe4245c0e9816f6075e6.tar.gz
sem:aaead65355253043297304bfde7a393054a4e7c5723de1ed3ff80340434c202a
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block make_flags %}
INSTALL_PATH=${out}/bin
{% endblock %}

{% block install %}
mkdir ${out}/bin
{{super()}}
{% endblock %}
