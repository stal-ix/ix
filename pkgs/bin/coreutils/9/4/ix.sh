{% extends '//bin/coreutils/9/1/ix.sh' %}

{% block openssl_ver %}
lib/openssl/3
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/coreutils/coreutils-9.4.tar.gz
sha:5f600d9093973b0afe25393d9bc18c44f2232657f4ca0d95ea31c702eb66b739
{% endblock %}

{% block cpp_includes %}
${PWD}/lib
{{super()}}
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|t, t, leapsec|t, t, (int)leapsec|' -i lib/posixtm.c
{% endblock %}
