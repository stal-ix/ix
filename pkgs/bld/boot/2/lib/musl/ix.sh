{% extends '//lib/musl/boot/ix.sh' %}

{% block script_exec %}
["/usr/bin/env", "PATH={{ix_boot_path}}", "env", "sh", "-s"]
{% endblock %}
