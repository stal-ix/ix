{% extends '//lib/llvm/t/mix.sh' %}

{% block lib_deps %}
lib/c++/mix.sh
{% endblock %}

{% block bld_libs %}
{% if target.os == 'linux' %}
lib/linux/mix.sh
{% endif %}
lib/compiler_rt/hack/mix.sh
{% endblock %}

{% block bld_tool %}
dev/tool/python/mix.sh
{% endblock %}

{% block patch %}
{{super()}}

cd compiler-rt

cat << EOF > fix.py
import sys

has = None

for l in sys.stdin.read().split('\n'):
    if 'add_compiler_rt_runtime(' in l:
        has = l
    else:
        if has:
            if l.strip() == 'SHARED':
                print('MESSAGE(')
            else:
                print(has)
                print(l)

            has = None
        else:
            print(l)
EOF

find . | grep CMakeLists.txt | while read l; do
    cat ${l} | python3 fix.py > _ && mv _ ${l}
done

for l in cmake/config-ix.cmake; do
    cat ${l} | grep -v 'HAS_GWP_ASAN TRUE' > _ && mv _ ${l}
done
{% endblock %}

{% block cmake_flags %}
{{super()}}
COMPILER_RT_BUILD_LIBFUZZER=OFF
COMPILER_RT_BUILD_MEMPROF=OFF
COMPILER_RT_BUILD_ORC=OFF
{% endblock %}
