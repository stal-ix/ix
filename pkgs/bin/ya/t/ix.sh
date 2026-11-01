{% extends '//die/c/ya.sh' %}

{% block fetch %}
https://github.com/yandex/yatool/archive/c475e0f238ddd60d119e977c77347da670773daf.tar.gz
2010297d02ff55fbc455c96315d658c87919499c417251ca5f5488f373c5e955
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/java/25
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
USE_SYSTEM_JDK=${JAVA_HOME}
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
