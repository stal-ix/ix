{% extends '//bld/box/shim/ix.sh' %}

{% block bld_deps %}
bld/boot/2/env
{% endblock %}

{% block script_exec %}
["/usr/bin/env", "PATH=/ix/realm/boot/bin:/bin:/usr/bin:/usr/local/bin", "/bin/sh", "-s"]
{% endblock %}
