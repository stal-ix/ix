{% extends '//boot/stage/8/bison/template/mix.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/bison/bison-3.7.6.tar.xz
# md5 d61aa92e3562cb7292b004ce96173cf7
{% endblock %}

{% block bison %}
boot/stage/8/bison/361/stage1/mix.sh
{% endblock %}

{% block patch %}
rm src/parse-gram.c src/parse-gram.h
{% endblock %}
