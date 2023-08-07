{% extends '//bin/qemu/t/ix.sh' %}

{% block git_repo %}
https://github.com/qemu/qemu
{% endblock %}

{% block git_branch %}
v8.0.4
{% endblock %}

{% block git_sha %}
77b41b1bfba7cce7ad720fb9dbd798982832f2e268b5f53257b4cf224c074764
{% endblock %}

{% block git_refine %}
rm roms/edk2/EmulatorPkg/Unix/Host/X11IncludeHack
{% endblock %}
