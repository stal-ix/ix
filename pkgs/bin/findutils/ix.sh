{% extends 'old/ix.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/findutils/findutils-4.10.0.tar.xz
sha:1387e0b67ff247d2abde998f90dfbf70c1491391a59ddfecb8ae698789f0a4f5
{% endblock %}

{% block cpp_includes %}
${PWD}/gl/lib
{% endblock %}

