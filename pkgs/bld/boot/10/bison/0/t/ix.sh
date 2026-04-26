{% extends '//bld/boot/10/bison/t/ix.sh' %}

{% block pkg_name %}
bison
{% endblock %}

{% block version %}
3.4.1
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/bison/bison-{{self.version().strip()}}.tar.xz
27159ac5ebf736dffd5636fd2cd625767c9e437de65baa63cb0de83570bd820d
https://github.com/stal-ix/sources/raw/main/bison-bootstrap-master.tar
089375c564e4f743ab0b5d4f6d23a871189e03110ed0ef56185ce783aa4a7cd3
{% endblock %}

{% block unpack %}
extract1 ${src}/bison-3*
extract0 ${src}/bison-b*
ln -s bison-b* bb
{% endblock %}
