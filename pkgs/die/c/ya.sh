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
{% endblock %}

{% block ya_make_cmd %}
ya
make
-r
-T
{% for x in ix.parse_list(self.ya_make_flags()) %}
-D{{x}}
--host-platform-flag={{x}}
{% endfor %}
{% block ya_make_targets %}
{% endblock %}
{% endblock %}

{% block build %}
{{ix.fix_list(self.ya_make_cmd())}}
{% endblock %}
