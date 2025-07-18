{% extends '//bin/coreutils/9/1/ix.sh' %}

{% block pkg_name %}
coreutils
{% endblock %}

{% block version %}
9.4
{% endblock %}

{% block openssl_ver %}
lib/openssl/3
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/coreutils/coreutils-{{self.version().strip()}}.tar.gz
5f600d9093973b0afe25393d9bc18c44f2232657f4ca0d95ea31c702eb66b739
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|t, t, leapsec|t, t, (int)leapsec|' -i lib/posixtm.c
{% endblock %}
