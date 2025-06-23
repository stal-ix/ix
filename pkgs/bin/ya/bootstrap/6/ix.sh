{% extends '//bin/ya/t/ix.sh' %}

{% block fetch %}
https://github.com/pg83/yaboot/archive/refs/tags/2.tar.gz
4b4643c5bd940a8e451d75cb9f401c8f59fed6c9d608f1692d0656a49cf09741
{% endblock %}

{% block git_repo %}
https://github.com/yandex/yatool
{% endblock %}

{% block git_commit %}
680419f91ada0bced3af3c874d4028b19335dee3
{% endblock %}

{% block git_sha %}
42bbcc73b7cc5d85a630740f4320c3b4c9f4cc78e7da43ba665b12b51a7730d8
{% endblock %}

{% block step_unpack %}
{{super()}}
extract 1 ${src}/2.tar.gz
{% endblock %}

{% block ya_c_flags %}
-Wno-error
{% endblock %}

{% block ya_make_targets %}
devtools/ymake/bin/ymake
{% endblock %}

{% block bld_tool %}
bin/gg
bin/ya/bootstrap/5(clang_ver=18)
{{super()}}
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
{% for x in self.badinc().strip().split('\n') %}
mkdir -p {{x | dirname}}
echo > {{x}}
{% endfor %}
{% endblock %}
