{% extends '//die/c/make.sh' %}

{% block git_repo %}
https://github.com/crawl/crawl
{% endblock %}

{% block git_branch %}
{{self.version().strip()}}
{% endblock %}

{% block git_commit %}
1eebc1a2892e1c89776a0d7a10691f8dac8d9796
{% endblock %}

{% block git_sha %}
24ea85c60fe567055f6df1ce33881859468b993b7d368c42412ed01c9b422ced
{% endblock %}

{% block pkg_name %}
crawl
{% endblock %}

{% block version %}
0.34.1
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/z
lib/lua/puc/5/4
lib/kernel
lib/ncurses
lib/sqlite/3
lib/execinfo/fake
pip/PyYAML
{% endblock %}

{% block bld_tool %}
bld/pkg/config
bld/perl
bld/fake/er(tool_name=git)
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block patch %}
echo "0.34.1" > util/release_ver
{% endblock %}

{% block step_unpack %}
{{super()}}
cd crawl-ref/source
{% endblock %}

{% block make_flags %}
{{super()}}
prefix=${out}
DATADIR=${out}/share/crawl
SAVEDIR=~/.crawl
BUILD_LUA=
BUILD_SQLITE=
NO_TRY_GOLD=yes
{% endblock %}
