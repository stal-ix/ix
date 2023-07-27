{% extends '//die/c/ninja.sh' %}

{% block git_repo %}
https://gn.googlesource.com/gn
{% endblock %}

{% block git_commit %}
4bd1a77e67958fb7f6739bd4542641646f264e5d
{% endblock %}

{% block git_sha %}
046c7f89d0048c2efa090deb8ca9c6e6b8e6027f7817da6df76bf5ad90935065
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
