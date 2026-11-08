{% extends '//bin/auto/make/1/16/3/ix.sh' %}

{% block version %}
1.20
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/automake/automake-{{self.version().strip()}}.tar.xz
f6f34dad4cbe395715762b0710f7c511e39bd5cf777e6b95818ccbecf7714248
{% endblock %}
