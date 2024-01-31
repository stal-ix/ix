{% extends '//bin/clang/16/ix.sh' %}

{% block bld_tool %}
lib/llvm/16/tblgen
{{super()}}
{% endblock %}

{% block llvm_targets %}
{{super()}}
clang-format
clang-rename
llvm-cov
llvm-profdata
llvm-rc
sancov
{% endblock %}

{% block clang_patches %}
cindex.patch
clang-format-patches.patch
asan_static.patch
D92001.patch
D21113-case-insesitive-include-paths.patch
D142421.patch
D149723-optimize-renamer-clang-tidy-check.patch
fix-build.patch
dwarf-emit-namespaces.patch
{% endblock %}

{% block llvm_patches %}
vfs-case-insensitive.patch
{% endblock %}

{% block patch %}
{{super()}}
cd llvm
{% for p in self.llvm_patches().strip().split() %}
(base64 -d | patch -p1) << EOF
{{ix.load_file('patches/llvm/' + p) | b64e}}
EOF
{% endfor %}
cd ..
cd clang
{% for p in self.clang_patches().strip().split() %}
(base64 -d | patch -p1) << EOF
{{ix.load_file('patches/clang/' + p) | b64e}}
EOF
{% endfor %}
{% endblock %}

{% block postinstall %}
:
{% endblock %}

{% block clang_fix_includes %}
:
{% endblock %}
