{% extends '//die/std/ix.sh' %}

{% block fetch %}
https://github.com/yandex/yatool/archive/c475e0f238ddd60d119e977c77347da670773daf.tar.gz
2010297d02ff55fbc455c96315d658c87919499c417251ca5f5488f373c5e955
{% endblock %}

{% block bld_tool %}
bld/python
bld/java/25
bin/ya/tools/clang(ya_c_flags=-Wno-error)
{% endblock %}

{% block script_init_env %}
{{super()}}
export CFLAGS=
export CXXFLAGS=
export CPPFLAGS=
export LDFLAGS=
export CTRFLAGS=
export CONLYFLAGS=
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

{% block ya_bootstrap %}no{% endblock %}
{% block ya_builder %}ya{% endblock %}
{% block ya_make_options %}-r{% endblock %}

{% block configure %}
base64 -d << EOF > ix-configure.py
{% include 'configure.py/base64' %}
EOF
python3 ix-configure.py {{self.ya_bootstrap().strip()}} {{host.os}} {{host.gnu_arch}} {{target.os}} {{target.gnu_arch}}
{% endblock %}

{% block build %}
export CFLAGS=
export CXXFLAGS=
export CPPFLAGS=
export LDFLAGS=
export ENFORCE_TTY=1
export YA_BUILD_PYTHON=$(command -v python3)
{{self.ya_builder().strip()}} make {{self.ya_make_options().strip()}} -j ${make_thrs} \
{% if self.ya_bootstrap().strip() == 'yes' %}
    --build-dir=${tmp}/ya-build --install=${tmp}/result \
{% else %}
    --build-root=${tmp}/ya-build --output=${tmp}/result \
{% endif %}
{% for flag in self.ya_make_flags() | parse_list %}
    -D{{flag}} --host-platform-flag={{flag}} \
{% endfor %}
{% for target in self.ya_make_targets() | parse_list %}
    {{target | dirname}} \
{% endfor %}
    --host-platform=default-{{host.os}}-{{host.gnu_arch}} \
    --target-platform=default-{{target.os}}-{{target.gnu_arch}}
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
{% for target in self.ya_make_targets() | parse_list %}
cp ${tmp}/result/{{target}} ${out}/bin/
{% endfor %}
{% endblock %}

{% block task_pool %}full{% endblock %}
