def package(mix):
    deps = [
        'dev/lang/clang',
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
