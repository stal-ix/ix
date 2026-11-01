{% extends '//bin/auto/make/1/16/3/ix.sh' %}

{% block version %}
1.18.1
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/automake/automake-{{self.version().strip()}}.tar.xz
168aa363278351b89af56684448f525a5bce5079d0b6842bd910fdd3f1646887
{% endblock %}
