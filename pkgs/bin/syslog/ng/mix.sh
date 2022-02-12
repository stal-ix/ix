{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://github.com/syslog-ng/syslog-ng/releases/download/syslog-ng-3.35.1/syslog-ng-3.35.1.tar.gz
sha:1d0238b06b3e5987c859e5b529ecee738f75bacff04b149398b1fe8cbb121e53
{% endblock %}

{% block bld_libs %}
lib/c
lib/cap
lib/glib
lib/json/c
lib/openssl
{% endblock %}

{% block bld_tool %}
bin/tar
bin/flex
bld/python
bin/bison/3/6
bin/auto/conf/archive
{% endblock %}

{% block touch_yl %}
{% endblock %}
