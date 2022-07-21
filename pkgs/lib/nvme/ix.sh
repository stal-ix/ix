{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/linux-nvme/libnvme/archive/refs/tags/v1.0.tar.gz
sha:387524b1c24a4091a88bfb258c98c054f716da210e77702f0709164740370807
{% endblock %}

{% block lib_deps %}
lib/c
lib/json/c
lib/openssl
lib/linux/util
{% endblock %}

{% block cpp_defines %}
SCOPE_DELIMITER=\\'%\\'
{% endblock %}
