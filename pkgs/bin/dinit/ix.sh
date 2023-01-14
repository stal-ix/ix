{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/davmac314/dinit/archive/66202530a8c2792b653036c5f43f6fc6063451c6.tar.gz
sem:5f5e3bccba09481489c1ef54f1c911b3b77e988b473a8df9403ed3455645a956
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bld/m4
{% endblock %}

{% block meson_flags %}
dinit-sbindir=${out}/bin
dinit-control-socket-path=/var/run/dinit/ctl
{% endblock %}
