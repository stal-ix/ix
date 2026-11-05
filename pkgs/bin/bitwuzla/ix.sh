{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
bitwuzla
{% endblock %}

{% block version %}
0.9.1
{% endblock %}

{% block fetch %}
https://github.com/bitwuzla/bitwuzla/archive/refs/tags/{{self.version().strip()}}.tar.gz
42707f38900a20bb18108e426ba667560d1fd2ccce0d4f75aa60439b546488b4
https://github.com/arminbiere/cadical/archive/rel-2.1.2.tar.gz
292c2bb8d712d6d05fce3d3df63b922b8fa45e03974a79f7bae5bf68c284f131
https://github.com/martin-cs/symfpu/archive/40bdec00e99f8ea1b96c3dac0a05eed11c541639.tar.gz
ba17877fbf0c851e113fddaab225152f1c0b2044429396b56b2f113832e36ce5
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/gmp/c++
lib/mpfr
{% endblock %}

{% block meson_tool %}
bld/meson/9
{% endblock %}

{% block bld_tool %}
bld/python
{% endblock %}

{% block meson_strip_wrap %}
# cadical and symfpu come as subprojects, from the package cache below
{% endblock %}

{% block patch %}
# the subprojects meson would download: cadical's release (its meson
# files come with bitwuzla), symfpu at the commit bitwuzla pins (it has
# no release), both from the package cache
mkdir -p subprojects/packagecache
cp ${src}/rel-2.1.2.tar.gz subprojects/packagecache/cadical-2.1.2.tar.gz
cp ${src}/40bdec00e99f8ea1b96c3dac0a05eed11c541639.tar.gz subprojects/packagecache/symfpu.tar.gz
cat << EOF > subprojects/symfpu.wrap
[wrap-file]
directory = symfpu-40bdec00e99f8ea1b96c3dac0a05eed11c541639
source_url = https://github.com/martin-cs/symfpu/archive/40bdec00e99f8ea1b96c3dac0a05eed11c541639.tar.gz
source_filename = symfpu.tar.gz
source_hash = ba17877fbf0c851e113fddaab225152f1c0b2044429396b56b2f113832e36ce5
patch_directory = symfpu

[provide]
symfpu = symfpu_dep
EOF
{% endblock %}

{% block meson_flags %}
{{super()}}
testing=disabled
unit_testing=disabled
python=false
docs=false
{% endblock %}
