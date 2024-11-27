{% extends '//die/std/ix.sh' %}

{% block git_repo %}
https://github.com/yandex/yatool
{% endblock %}

{% block git_commit %}
ff47bb5d587380afbc57da8a463f5f394ee8b528
{% endblock %}

{% block git_sha %}
8c53df0645d6127a109f48aa63a7578019967496b0b62b724ac0cc564ea13bd3
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
USE_ARCADIA_PYTHON=yes
USE_PYTHON3=yes
OBJCOPY_TOOL=${YA_OBJCOPY}
OBJDUMP_TOOL=${YA_OBJDUMP}
STRIP_TOOL=${YA_STRIP}
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
--cxx-compiler=${YA_CLANGXX}
--c-compiler=${YA_CLANG}
--ymake-bin=${YA_YMAKE}
--no-yt-store
devtools/ya/bin
{% endblock %}

{% block build %}
export YA_YMAKE=$(which ymake)
export YA_PYTHON=$(which python3)
export YA_CLANG=$(which clang)
export YA_CLANGXX=$(which clang++)
export YA_OBJCOPY=$(which llvm-objcopy)
export YA_OBJDUMP=$(which llvm-objdump)
export YA_STRIP=$(which llvm-strip)
export YA_TC=no
export YA_NO_RESPAWN=1
export YA_CACHE_DIR=${tmp}/ya
{{ix.fix_list(self.ya_make_cmd())}}
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp devtools/ya/bin/ya-bin ${out}/bin/
{% endblock %}

{% block patch %}
sed -e 's|.*NEED_BINUTILS_PEERDIR=yes.*||' \
    -e 's|.*BINUTILS_ROOT_RESOURCE_GLOBAL.*||' \
    -i build/ymake.core.conf
{% endblock %}
