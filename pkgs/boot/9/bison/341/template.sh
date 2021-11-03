{% extends '//boot/9/bison/template/mix.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/bison/bison-3.4.1.tar.xz
# md5 201286a573b12da109df96282fe4ff4a
# url https://storage.yandexcloud.net/mix-cache/bison-bootstrap-master.tar.bz2
# md5 425bbc1c4a21e708f05d35c62210f5ee
{% endblock %}

{% block unpack %}
${untar} ${src}/bison-3* && cd bison* && ${untar} ${src}/bison-b* && ln -s bison-b* bb
{% endblock %}
