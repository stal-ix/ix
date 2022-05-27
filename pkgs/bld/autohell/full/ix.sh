{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/m4
bld/perl
bld/libtool
bin/auto/conf/{{conf_ver or '2/69'}}
bin/auto/make/{{make_ver or '1/16/5'}}
{% endblock %}
