{% extends '//lib/musl/boot/ix.sh' %}

{% block script_exec %}
["/usr/bin/env", "PATH={{ix_boot_path}}", "/bin/sh", "-s"]
{% endblock %}
