{% extends '//die/std/ix.sh' %}

{% block bld_tool %}
bld/python
bin/ya/clang
bin/clang/18
bin/ya/wrapper
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
HAVE_CUDA=no
EMBED_SBOM=no
USE_ICONV=static
YMAKE_USE_PY3=yes
YA_OPENSOURCE=yes
USE_SYSTEM_JDK=/usr
OPENSOURCE_PROJECT=ya
YMAKE_EXCLUDE_IDL_TOOL=yes
{% endblock %}

{% block ya_make_cmd %}
ya
make
-r
-T
--musl
{% for x in ix.parse_list(self.ya_make_flags()) %}
-D{{x}}
--host-platform-flag={{x}}
{% endfor %}
devtools/ya/bin
{% endblock %}

{% block build %}
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
