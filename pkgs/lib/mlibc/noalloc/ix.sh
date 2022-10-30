{% extends '//lib/mlibc/pure/ix.sh' %}

{% block bld_tool %}
{{super()}}
bld/python
{% endblock %}

{% block patch %}
{{super()}}

cat << EOF > options/internal/include/mlibc/allocator.hpp
{% include 'allocator.h' %}
EOF

cat << EOF > options/internal/generic/allocator.cpp
{% include 'allocator.cpp' %}
EOF

cat << EOF > run.py
import sys

skip = False

for l in sys.stdin.read().split('\n'):
    if 'void free' in l:
        skip = True

    if not skip:
        print(l)
EOF

cat options/ansi/generic/stdlib-stubs.cpp | python3 ./run.py > _
mv _ options/ansi/generic/stdlib-stubs.cpp
{% endblock %}
