{% extends '//die/c/ninja.sh' %}

{% block git_repo %}
https://gn.googlesource.com/gn
{% endblock %}

{% block git_commit %}
cad8f67e2dd0cea00bbe4566efe2fdf4c1821563
{% endblock %}

{% block git_sha %}
54447fb0b5080cb502f3cbd95b141c150dac96423a5542f595c76125ad39ace1
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bld/python
{% endblock %}

{% block configure %}
python3 build/gen.py          \
    --platform {{target.os}}  \
    --no-last-commit-position \
    --out-path {{self.ninja_build_dir()}}
{% endblock %}

{% block cpp_includes %}
${PWD}
{% endblock %}

{% block patch %}
cat << EOF > last_commit_position.h
#define LAST_COMMIT_POSITION_NUM 1
#define LAST_COMMIT_POSITION "1"
EOF
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp {{self.ninja_build_dir()}}/gn ${out}/bin/
{% endblock %}
