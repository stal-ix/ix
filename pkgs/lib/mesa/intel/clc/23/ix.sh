{% extends '//die/c/meson.sh' %}

{% block fetch %}
{% include '//lib/mesa/t/ver.sh' %}
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/clc
lib/kernel
lib/llvm/23
lib/spirv/tools
lib/spirv/llvm/translator/23
{% endblock %}

{% block bld_tool %}
pip/Mako
bld/flex
bld/bison
pip/PyYAML
bld/llvm/config
bld/spirv/tools
{% endblock %}

{% block patch %}
patch -p1 <<'EOF'
--- a/src/compiler/clc/clc_helpers.cpp
+++ b/src/compiler/clc/clc_helpers.cpp
@@ -869,2 +869,2 @@ clc_compile_to_llvm_module(LLVMContext &llvm_ctx,
-#if LLVM_VERSION_MAJOR >= 20
+#if LLVM_VERSION_MAJOR >= 20 && LLVM_VERSION_MAJOR < 22
                    *llvm::vfs::getRealFileSystem(),
@@ -1158,15 +1158,14 @@ llvm_mod_to_spirv(std::unique_ptr<::llvm::Module> mod,
    if (args->use_llvm_spirv_target) {
       const char *triple = args->address_bits == 32 ? "spirv-unknown-unknown" : "spirv64-unknown-unknown";
       std::string error_msg("");
-      auto target = TargetRegistry::lookupTarget(triple, error_msg);
-      if (target) {
-         auto TM = target->createTargetMachine(
 #if LLVM_VERSION_MAJOR >= 21
-            llvm::Triple(triple),
+      auto temp_triple = llvm::Triple(triple);
 #else
-            triple,
+      auto temp_triple = triple;
 #endif
-            "", "", {}, std::nullopt, std::nullopt,
+      auto target = TargetRegistry::lookupTarget(temp_triple, error_msg);
+      if (target) {
+         auto TM = target->createTargetMachine(temp_triple, "", "", {}, std::nullopt, std::nullopt,
 #if LLVM_VERSION_MAJOR >= 18
             ::llvm::CodeGenOptLevel::None
 #else
EOF
{% endblock %}

{% block ninja_build_targets %}
src/compiler/clc/mesa_clc
src/compiler/spirv/vtn_bindgen2
{% endblock %}

{% block meson_flags %}
gallium-drivers=
vulkan-drivers=
platforms=
tools=
install-mesa-clc=true
mesa-clc=enabled
video-codecs=
xmlconfig=disabled
llvm=enabled
shared-llvm=disabled
cpp_rtti=false
shader-cache=disabled
intel-rt=disabled
{% endblock %}

{% block meson_cross %}
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/obj/src/compiler/clc/mesa_clc ${out}/bin/
cp ${tmp}/obj/src/compiler/spirv/vtn_bindgen2 ${out}/bin/
{% endblock %}

{% block postinstall %}
:
{% endblock %}
