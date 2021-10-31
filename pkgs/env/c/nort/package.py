def package(mix):
    deps = [
        'dev/lang/clang/package.sh',
    ]

    return {
        'build': {
            'script': mix.files.build_py,
            'depends': deps,
        },
        'runtime': {
            'depends': deps,
        },
    }
