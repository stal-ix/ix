{% extends '//die/std/ix.sh' %}

{% block bld_tool %}
bin/ya/clang(ya_c_flags={{self.ya_c_flags().strip()}})
bld/python
bld/compiler
bld/fake/binutils
{% endblock %}

{% block script_init_env %}
{{super()}}
export ENFORCE_TTY=1
export CFLAGS=
export LDFLAGS=
export CTRFLAGS=
export OPTFLAGS=
export CPPFLAGS=
export CXXFLAGS=
export CONLYFLAGS=
{% endblock %}

{% block ya_c_flags %}
{% endblock %}

{% block ya_make_flags %}
{% endblock %}

{% block ya_make_targets %}
{% endblock %}

{% block ya_make_cmd %}
ya
make
-r
-T
-j ${make_thrs}
--host-platform=default-{{host.os}}-{{host.gnu_arch}}
--target-platform=default-{{target.os}}-{{target.gnu_arch}}
{% for x in ix.parse_list(self.ya_make_flags()) %}
-D{{x}}
--hpf={{x}}
{% endfor %}
{% for x in ix.parse_list(self.ya_make_targets()) %}
{{x | dirname}}
{% endfor %}
{% endblock %}

{% block build %}
{{ix.fix_list(self.ya_make_cmd())}}
{% endblock %}

{% block install %}
mkdir ${out}/bin
{% for x in ix.parse_list(self.ya_make_targets()) %}
cp {{x}} ${out}/bin/
{% endfor %}
{% endblock %}
