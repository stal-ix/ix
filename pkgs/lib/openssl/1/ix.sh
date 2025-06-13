{% extends '//lib/openssl/t/ix.sh' %}

{% block pkg_name %}
openssl
{% endblock %}

{% block version %}
1.1.1j
{% endblock %}

{% block fetch %}
https://www.openssl.org/source/old/{{self.version().strip()[:-1]}}/openssl-{{self.version().strip()}}.tar.gz
sha:aaf2fcb575cdf6491b98ab4829abf78a3dec8402b8b81efc8f23c00d443981bf
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
