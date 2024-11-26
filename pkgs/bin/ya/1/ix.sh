{% extends '//die/std/ix.sh' %}

{% block git_repo %}
https://github.com/yandex/yatool
{% endblock %}

{% block git_commit %}
326a61a16480c9e5dd91fb09844388c72443e78a
{% endblock %}

{% block git_sha %}
c57c9998443e4e8bdf5b3b1c33df643993116b8d96ddea9735fb8ac55db45737
{% endblock %}

{% block bld_tool %}
bin/ya/0
bld/python
bin/ya/clang
bin/clang/18
bld/fake/binutils
{% endblock %}

{% block script_init_env %}
{{super()}}
export CFLAGS=
export LDFLAGS=
export CTRFLAGS=
export OPTFLAGS=
export CPPFLAGS=
export CXXFLAGS=
export CONLYFLAGS=
{% endblock %}

{% block ya_make_flags %}
USE_ICONV=static
MUSL=yes
USE_PREBUILT_TOOLS=no
OPENSOURCE=yes
OPENSOURCE_PROJECT=ya
DISABLE_YMAKE_CONF_CUSTOMIZATION=yes
OS_SDK=local
BUILD_PYTHON3_BIN=${YA_PYTHON}
BUILD_PYTHON_BIN=${YA_PYTHON}
USE_SYSTEM_JDK=/usr
YA_OPENSOURCE=yes
YMAKE_EXCLUDE_IDL_TOOL=yes
HAVE_CUDA=no
EMBED_SBOM=no
YMAKE_USE_PY3=yes
{% endblock %}

{% block ya_make_cmd %}
ya-bin
make
-rT
--musl
{% for x in ix.parse_list(self.ya_make_flags()) %}
-D{{x}}
--host-platform-flag={{x}}
{% endfor %}
--no-ya-bin-resource
--cxx-compiler ${YA_CLANGXX}
--c-compiler ${YA_CLANG}
--ymake-bin ${YA_YMAKE}
--no-yt-store
devtools/ymake/bin
{% endblock %}

{% block build %}
export YA_YMAKE=$(which ymake)
export YA_PYTHON=$(which python3)
export YA_CLANG=$(which clang)
export YA_CLANGXX=$(which clang++)
export YA_TC=no
export YA_NO_RESPAWN=1
export YA_CACHE_DIR=${tmp}/ya
{{ix.fix_list(self.ya_make_cmd())}}
{% endblock %}

{% block install %}
exit 1
{% endblock %}
