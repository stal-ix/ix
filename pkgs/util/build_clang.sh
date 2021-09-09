# run env/lld env/compiler env/system
{% include '//util/fetch_llvm.sh' %}

build() {
    $untar $src/llvm* && cd llvm*

{% if mix.platform.target.os == 'darwin' %}
    export LDFLAGS="-Wl,-w $LDFLAGS"
{% endif %}

    (
        mkdir b && cd b
        ln -s $(which dash) sh
        setup_compiler
    )

    export PATH="$(pwd)/b:$PATH"

    {% block prebuild %}{% endblock %}

    build_cmake_ninja \
        -DLLVM_BUILD_LLVM_DYLIB=OFF \
        -DLLVM_LINK_LLVM_DYLIB=OFF \
        -DLLVM_ENABLE_PROJECTS="clang;lld;polly" \
        -DCLANG_LINK_CLANG_DYLIB=OFF \
        -DLLVM_POLLY_LINK_INTO_TOOLS=ON \
        -DLLVM_ENABLE_PIC=OFF \
        -DLLVM_DYLIB_COMPONENTS='' \
        -DBUILD_SHARED_LIBS=OFF \
        ../llvm
}
