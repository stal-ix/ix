{% extends 'template.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/bison/bison-3.7.6.tar.xz
sha:67d68ce1e22192050525643fc0a7a22297576682bef6a5c51446903f5aeef3cf
{% endblock %}

{% block bison %}
bld/boot/9/bison/3.6.1_1.sh
{% endblock %}
