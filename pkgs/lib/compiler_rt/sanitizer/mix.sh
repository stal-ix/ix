{% extends '//lib/compiler_rt/template/mix.sh' %}

{% block bld_libs %}
lib/linux
lib/c/naked
{% endblock %}

{% block bld_tool %}
bld/python
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
COMPILER_RT_BUILD_SANITIZERS=ON
COMPILER_RT_BUILD_BUILTINS=OFF
COMPILER_RT_BUILD_XRAY=OFF
COMPILER_RT_BUILD_LIBFUZZER=OFF
COMPILER_RT_BUILD_PROFILE=OFF
COMPILER_RT_BUILD_MEMPROF=OFF
COMPILER_RT_BUILD_XRAY_NO_PREINIT=OFF
COMPILER_RT_BUILD_ORC=OFF
COMPILER_RT_CAN_EXECUTE_TESTS=OFF
COMPILER_RT_EXTERNALIZE_DEBUGINFO=OFF
{% endblock %}

{% block env_lib %}
export LDFLAGS="-resource-dir=${out} \${LDFLAGS}"
{% endblock %}
