{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/axel-download-accelerator/axel/archive/refs/tags/v2.17.12.tar.gz
sha:0ba5fa5ffd919faa51b0e55717a59f9475c2913095bc14c27c2e24ab2dad3ce9
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/openssl
{% endblock %}

{% block bld_tool %}
bld/gettext
bin/auto/conf/archive
bld/fake(tool_name=txt2man)
{% endblock %}

{% block configure_flags %}
--with-ssl=openssl
{% endblock %}

{% block patch %}
sed -e 's|int |_Atomic |' -i src/random.c
{% endblock %}
