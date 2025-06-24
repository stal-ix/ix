{% extends '//bin/ya/t/2/ix.sh' %}

{% block git_commit %}
{{ya_git_commit}}
{% endblock %}

{% block git_sha %}
{{ya_git_sha}}
{% endblock %}

{% block bld_tool %}
{{ya_boot_tc}}(ya_git_commit={{ya_git_commit}},ya_git_sha={{ya_git_sha}},clang_ver={{clang_ver}})
{{super()}}
{% endblock %}

{% block ya_make_targets %}
devtools/ymake/bin/ymake
devtools/ya/bin/ya-bin
{% endblock %}

{% block badinc %}
contrib/python/numpy/py2/numpy/core/include/numpy/arrayobject.h
contrib/python/numpy/py2/numpy/core/include/numpy/config.h
contrib/python/numpy/py2/numpy/core/include/numpy/npy_common.h
contrib/python/numpy/py2/numpy/core/include/numpy/npy_cpu.h
contrib/python/numpy/py2/numpy/core/include/numpy/npy_endian.h
contrib/python/numpy/py2/numpy/core/include/numpy/npy_math.h
contrib/python/numpy/py2/numpy/core/include/numpy/npy_os.h
contrib/python/numpy/py2/numpy/core/include/numpy/numpyconfig.h
contrib/python/numpy/py2/numpy/core/include/numpy/ufuncobject.h
contrib/python/numpy/py2/numpy/core/include/numpy/utils.h
contrib/python/numpy/py2/numpy/core/src/common/npy_config.h
contrib/python/numpy/py2/numpy/core/src/common/npy_fpmath.h
contrib/python/numpy/py2/numpy/core/src/npymath/npy_math_internal.h
{% endblock %}

{% block patch %}
{{super()}}
find contrib/libs/libunwind -type f | while read l; do
    sed -e 's|#pragma.*||' -i ${l}
done
base64 -d << EOF > contrib/libs/openssl/ar.pyplugin
{% include 'ar.pyplugin/base64' %}
EOF
{% for x in self.badinc().strip().split('\n') %}
mkdir -p {{x | dirname}}
echo > {{x}}
{% endfor %}
{% endblock %}
