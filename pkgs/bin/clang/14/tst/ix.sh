{% extends '//bin/clang/14/gcc/ix.sh' %}

{% block c_compiler %}
bin/gcc(gcc_ver=7,for_target={{host.gnu.three}})
bin/gcc(gcc_ver=7,for_target={{target.gnu.three}})
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|const APInt \&|const auto\&|g' -i llvm/utils/TableGen/CodeGenSchedule.cpp
sed -e 's|(CHIArg \&A)|(auto \&A)|g' -i llvm/lib/Transforms/Scalar/GVNHoist.cpp
sed -e 's|OverriderInfo\& Overrider =|auto\& Overrider =|' -i clang/lib/AST/VTableBuilder.cpp
{% endblock %}
