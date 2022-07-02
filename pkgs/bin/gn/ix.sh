{% extends '//die/ninja.sh' %}

{% block fetch %}
https://gn.googlesource.com/gn/+archive/18df6af86191edab1e47c84d56e608da414d446b.tar.gz
sem:
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bld/python
{% endblock %}

{% block skip_dirs %}0{% endblock %}

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
