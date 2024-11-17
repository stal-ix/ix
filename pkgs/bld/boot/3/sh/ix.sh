{% extends '//bin/dash/sh/old/ix.sh' %}

{% block make_no_thrs %}{% endblock %}

{% block bld_libs %}
bld/boot/1/lib/c
{% endblock %}

{% block bld_deps %}
bld/boot/3/make
bld/boot/2/env
{% endblock %}

{% block script_exec %}
["/usr/bin/env", "PATH={{ix_boot_path}}", "/bin/sh", "-s"]
{% endblock %}
