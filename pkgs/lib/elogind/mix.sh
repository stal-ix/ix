{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://github.com/elogind/elogind/archive/refs/tags/v246.10.tar.gz
32ab2201281f14738d9c045f3669c14d
{% endblock %}

{% block bld_tool %}
dev/lang/m4/mix.sh
dev/tool/gperf/mix.sh
{% endblock %}

{% block lib_deps %}
lib/c/mix.sh
lib/cap/mix.sh
lib/udev/mix.sh
{% endblock %}

{% block setup %}
export PATH="${PATH}:/usr/bin"
{% endblock %}

{% block patch %}
cat << EOF > fix.py
import sys

repl = False

for l in sys.stdin.read().split('\n'):
    if 'libelogind = library' in l:
        repl = True

    if repl:
        if "'elogind'" in l:
            l = l.replace('elogind', 'elogind_any')
            repl = False

    print(l)
EOF

cat meson.build | python3 fix.py > _ && mv _ meson.build
{% endblock %}
