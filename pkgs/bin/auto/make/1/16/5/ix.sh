{% extends '//bin/auto/make/1/16/3/ix.sh' %}

{% block pkg_name %}
automake
{% endblock %}

{% block version %}
1.16.5
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/automake/automake-{{self.version().strip()}}.tar.xz
sha:f01d58cd6d9d77fbdca9eb4bbd5ead1988228fdb73d6f7a201f5f8d6b118b469
{% endblock %}
