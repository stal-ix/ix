{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/curl/curl/archive/refs/tags/curl-7_79_1.tar.gz
7a6ac0611e8fc77aa8b49d6b4bbdbbdc
{% endblock %}

{% block lib_deps %}
lib/z/mix.sh
lib/c-ares/mix.sh
lib/idn2/mix.sh
lib/zstd/mix.sh
lib/brotli/mix.sh
lib/nghttp2/mix.sh
lib/{{mix.flags.get('curlssl', 'openssl')}}/mix.sh
{{'sys/framework/SystemConfiguration/mix.sh' | darwin}}
{% endblock %}

{% block bld_deps %}
dev/doc/groff/mix.sh
dev/build/autoconf/2.71/mix.sh
dev/build/automake/1.16.3/mix.sh
{{super()}}
{% endblock %}

{% block autoreconf %}
autoreconf -fi
{% endblock %}

{% block coflags %}
--enable-manual
{% endblock %}
