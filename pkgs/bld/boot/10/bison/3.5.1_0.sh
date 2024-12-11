{% extends 'template.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/bison/bison-3.5.1.tar.xz
sha:3e7e097bd9709a2d5e40e69446b74b149733b3de864fadb7a9b54eca7b2a4dd0
{% endblock %}

{% block bison %}
bld/boot/10/bison/2
{% endblock %}

{% block bison_patch %}
cd src

cat parse-gram.y | grep -v 'define api.token.raw' > _ && mv _ parse-gram.y
{% endblock %}
