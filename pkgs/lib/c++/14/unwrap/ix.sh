{% extends '//lib/c++/14/ix.sh' %}

{% block install %}
{{super()}}

sed -e 's|__wrap_iter<pointer>|pointer|' \
    -e 's|__wrap_iter<const_pointer>|const_pointer|' \
    -i ${out}/include/vector

cat << EOF > fix.py
import sys

def it():
    skip = False

    for l in sys.stdin.read().split('\n'):
        if 'vector<bool>' in l:
            skip = True

        if skip and '_Tp' in l:
            skip = False

        if not skip:
            yield l

sys.stdout.write('\n'.join(it()).strip() + '\n')
EOF

cat ${out}/include/vector | python3 fix.py > _
mv _ ${out}/include/vector

cat << EOF > ${out}/include/stlfwd
#pragma once
#include <iostream>
#include <array>
#include <map>
#include <list>
#include <string>
#include <vector>
#include <memory>
#include <deque>
#include <tuple>
#include <set>
#include <functional>
EOF
{% endblock %}
