{% extends '//lib/openssl/t/ix.sh' %}

{% block pkg_name %}
openssl
{% endblock %}

{% block version %}
1.1.1j
{% endblock %}

{% block fetch %}
https://www.openssl.org/source/old/{{self.version().strip()[:-1]}}/openssl-{{self.version().strip()}}.tar.gz
md5:cccaa064ed860a2b4d1303811bf5c682
{% endblock %}

{% block openssl_conf_opts %}
no-hw
{% endblock %}

{% block openssl_platforms %}
{{super()}}
PLATFORM_linux_riscv64="linux-generic64"
{% endblock %}

{% block env %}
{{super()}}
export ac_cv_working_openssl_hashlib=yes
export ac_cv_working_openssl_ssl=yes
{% endblock %}
