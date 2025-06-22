{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/ix/init/rc
bin/ix/init/pid1
bin/runit/sys/etc
bin/ix/init/binaries(bumpalloc_buf=10000)
{% endblock %}
