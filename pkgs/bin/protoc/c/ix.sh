{% extends '//lib/protobuf/c/t/ix.sh' %}

{% block bld_libs %}
lib/c
lib/c++
lib/protoc
{% endblock %}

{% block bld_tool %}
bin/protoc
{% endblock %}

{% block patch %}
{{super()}}
find . -type f -name '*.h' | while read l; do
    sed -e 's|.*GOOGLE_DISALLOW_EVIL_CONSTRUCTORS.*||' -i ${l}
done
find . -type f -name '*.cc' | while read l; do
    sed -e 's|DFATAL|FATAL|g' -i ${l}
done
cp -R ${PROTO_PATH}/google ./
{% endblock %}

{% block setup_target_flags %}
{{super()}}
export CXXFLAGS="-std=c++17 ${CXXFLAGS}"
{% endblock %}

{% block cpp_defines %}
private=public
GOOGLE_LOG=ABSL_LOG
GOOGLE_ARRAYSIZE=ABSL_ARRAYSIZE
GOOGLE_CHECK_EQ=ABSL_CHECK_EQ
GOOGLE_DCHECK_GE=ABSL_DCHECK_GE
{% endblock %}
