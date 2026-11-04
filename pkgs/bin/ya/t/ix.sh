{% extends '//die/c/ya.sh' %}

{% block fetch %}
https://github.com/yandex/yatool/archive/4e1ea6a99232d3c2e69d8fe5cc032f0215c0536f.tar.gz
6085f7fb097637ab14e673df79109c96fb9f44581b529ce2d449b2df65413a72
{% endblock %}

{% block ya_c_flags %}
-Wno-error
{% endblock %}

{% block ya_make_targets %}
devtools/ymake/bin/ymake
devtools/ya/bin/ya-bin
{% endblock %}

{% block ya_make_flags %}
{% if linux %}
MUSL=yes
{% endif %}
OS_SDK=local
USE_PREBUILT_TOOLS=no
OPENSOURCE=yes
OPENSOURCE_PROJECT=ya
YA_OPENSOURCE=yes
HAVE_CUDA=no
EMBED_SBOM=no
USE_ICONV=static
YMAKE_USE_PY3=yes
YMAKE_EXCLUDE_IDL_TOOL=yes
NO_DEBUGINFO=yes
BUILD_PYTHON3_BIN=${YA_BUILD_PYTHON}
BUILD_PYTHON_BIN=${YA_BUILD_PYTHON}
{% endblock %}

{% block ya_make_options %}
-r
--build-root=${tmp}/ya-build
--output=${tmp}/result
{% endblock %}

{% block configure %}
base64 -d << EOF > ix-configure.py
{% include 'configure.py/base64' %}
EOF
{% set command_args %}
python3 ix-configure.py
{% block configure_flags %}
{% endblock %}
{{host.os}} {{host.gnu_arch}} {{target.os}} {{target.gnu_arch}}
{% endset %}
{{command_args | fix_list}}
{% endblock %}

{% block build %}
export CFLAGS=
export CXXFLAGS=
export CPPFLAGS=
export LDFLAGS=
export YA_BUILD_PYTHON=$(command -v python3)
{{super()}}
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
{% for x in self.ya_make_targets() | parse_list %}
cp ${tmp}/result/{{x}} ${out}/bin/
{% endfor %}
{% endblock %}
