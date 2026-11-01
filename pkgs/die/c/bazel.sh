{% extends 'ninja.sh' %}

{# C/C++ targets of a Bazel workspace, built without Bazel. bazel_lite
   (bld/bazel/lite) runs the BUILD and .bzl files as Python, resolves
   select() for this target and writes the build.ninja that ninja.sh
   builds and installs: lib<name>.a, alwayslink objects in
   lib/alwayslink/lib<name>.a (linked whole through LDFLAGS) and the
   headers at their include paths.

   bazel_targets  labels to build, with their transitive closure
   bazel_repos    external repositories ix already provides; deps on
                  them are dropped and come from lib_deps instead
   bazel_flags    the .bazelrc part that matters: --cxxopt=, --copt=,
                  --define=, --config=<setting>=0|1, --flag=<key>=<value> #}

{% block std_box %}
bld/bazel/lite
{{super()}}
{% endblock %}

{% block bazel_name %}
{{basename}}
{% endblock %}

{% block bazel_targets %}
{% endblock %}

{% block bazel_repos %}
{% endblock %}

{% block bazel_flags %}
{% endblock %}

{% block bazel_platform %}
--platform=@platforms//os:{{target.os}}
--platform=@platforms//cpu:{{target.gnu_arch}}
--flag=@bazel_tools//tools/cpp:compiler=clang
--flag=compiler=clang
--flag=compilation_mode=opt
{% endblock %}

{% block configure %}
{% set command_args %}
bazel_lite
--root=${PWD}
--out={{ninja_build_dir}}
--prefix=${out}
--name={{self.bazel_name().strip()}}
{% for x in self.bazel_targets() | parse_list %}
--target={{x}}
{% endfor %}
{% for x in self.bazel_repos() | parse_list %}
--repo={{x}}
{% endfor %}
{{self.bazel_platform()}}
{{self.bazel_flags()}}
{% endset %}
{{command_args | fix_list}}
{% endblock %}

{% block env %}
{{super()}}
$(cat {{ninja_build_dir}}/env)
{% endblock %}
