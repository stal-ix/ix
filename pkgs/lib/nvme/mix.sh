{% extends '//mix/meson.sh' %}

{% block fetch %}
https://github.com/linux-nvme/libnvme/archive/refs/tags/v1.0-rc7.tar.gz
sha:7e036bfab775911bd3a9bd1b944ac88f4de29c4de7327aaa949cceb866db5fe8
{% endblock %}

{% block lib_deps %}
lib/c
lib/json/c
lib/openssl
# uuid
bin/util/linux
{% endblock %}

{% block cpp_defines %}
SCOPE_DELIMITER=\\'%\\'
{% endblock %}
