{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://github.com/containers/crun/releases/download/1.4.5/crun-1.4.5.tar.xz
sha:9b3795700f997d96221118edb3296177020b3160720ea20762c7cced274f0d0c
{% endblock %}

{% block bld_libs %}
lib/c
lib/cap
lib/intl
lib/yajl
lib/seccomp
lib/argp/standalone
{% endblock %}

{% block bld_tool %}
bld/python
{% endblock %}

{% block configure_flags %}
--disable-systemd
{% endblock %}

{% block patch %}
find . -type f -name '*.c' | while read l; do
    sed -e 's|error.*EXIT_FAILURE.*|exit(1);|' -i ${l}
done
{% endblock %}
