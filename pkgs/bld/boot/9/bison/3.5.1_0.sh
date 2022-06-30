{% extends 'template.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/bison/bison-3.5.1.tar.xz
sha:
{% endblock %}

{% block bison %}
bld/boot/9/bison/3.4.1_2.sh
{% endblock %}

{% block bison_patch %}
cd src

cat parse-gram.y | grep -v 'define api.token.raw' > _ && mv _ parse-gram.y
{% endblock %}
