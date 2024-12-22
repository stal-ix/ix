{% extends '//bin/dash/sh/old/ix.sh' %}

{% block make_no_thrs %}{% endblock %}

{% block bld_libs %}
bld/boot/2/lib/c
{% endblock %}

{% block bld_deps %}
bld/boot/2/env
{% endblock %}

{% block script_exec %}
["/usr/bin/env", "PATH={{ix_boot_path}}", "sh", "-s"]
{% endblock %}
