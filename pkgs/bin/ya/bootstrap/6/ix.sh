{% extends '//bin/ya/t/ix.sh' %}

{% block fetch %}
https://github.com/pg83/yaboot/archive/refs/tags/2.tar.gz
4b4643c5bd940a8e451d75cb9f401c8f59fed6c9d608f1692d0656a49cf09741
{% endblock %}

{% block git_repo %}
https://github.com/yandex/yatool
{% endblock %}

{% block git_commit %}
645493a0af867b356ecf11435dcf020ad2233d53
{% endblock %}

{% block git_sha %}
025ed8999ff0d817a5be687f0837931876fc8698c1d39e9a1c5b7345fb33e8f2
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
