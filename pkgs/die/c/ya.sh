{% extends '//die/std/ix.sh' %}

{% block bld_tool %}
{% block ya_clang_wrapper %}
bin/ya/tools/clang(ya_c_flags={{self.ya_c_flags().strip()}})
{% endblock %}
bld/python
bld/compiler(clang_ver={{clang_ver}})
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
{% block ya_platform %}
--host-platform=default-{{host.os}}-{{host.gnu_arch}}
--target-platform=default-{{target.os}}-{{target.gnu_arch}}
{% endblock %}
{% for x in ix.parse_list(self.ya_make_flags()) %}
-D{{x}}
--host-platform-flag={{x}}
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

{% block task_pool %}full{% endblock %}
