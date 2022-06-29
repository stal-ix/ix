{% extends 'template.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/bison/bison-3.4.1.tar.xz
md5:201286a573b12da109df96282fe4ff4a
https://storage.yandexcloud.net/mix-cache/bison-bootstrap-master.tar.bz2
md5:425bbc1c4a21e708f05d35c62210f5ee
{% endblock %}

{% block unpack %}
extract1 ${src}/bison-3*
extract0 ${src}/bison-b*
ln -s bison-b* bb
{% endblock %}
