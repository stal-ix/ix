{% extends '//die/c/ninja.sh' %}

{% block git_repo %}
https://gn.googlesource.com/gn
{% endblock %}

{% block git_commit %}
4bd1a77e67958fb7f6739bd4542641646f264e5d
{% endblock %}

{% block git_sha %}
da26187ee4f269a68be8b4170f087d10ea63cca4c2ad7885d484b731a47e1410
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
