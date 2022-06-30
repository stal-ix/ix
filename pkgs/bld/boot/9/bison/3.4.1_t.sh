{% extends 'template.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/bison/bison-3.4.1.tar.xz
sha:
https://storage.yandexcloud.net/mix-cache/bison-bootstrap-master.tar.bz2
sha:
{% endblock %}

{% block unpack %}
extract1 ${src}/bison-3*
extract0 ${src}/bison-b*
ln -s bison-b* bb
{% endblock %}
