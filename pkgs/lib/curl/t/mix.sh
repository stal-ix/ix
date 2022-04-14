{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://github.com/curl/curl/archive/refs/tags/curl-7_82_0.tar.gz
sha:a6a4485622871c2111ab9345e813935a230bd564eabe768be3950b39a66b44b3
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/zstd
lib/ssh/2
lib/idn/2
lib/brotli
lib/c-ares
lib/ng/tcp2
lib/ng/http/2
lib/ng/http/3
lib/{{curlssl or 'openssl'}}

{% if darwin %}
lib/darwin/framework/SystemConfiguration
{% endif %}
{% endblock %}

{% block bld_tool %}
bld/autohell
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block configure_flags %}
{% if linux %}
--with-random="/dev/urandom"
{% endif %}
{% endblock %}
