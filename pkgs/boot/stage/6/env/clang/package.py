def package(mix):
    deps = [
        'boot/stage/6/clang/package.sh',
    ]

    return {
        'build': {
            'script': mix.files.build_py,
            'depends': deps,
        },
        'runtime': {
            'depends': deps + [
                'boot/stage/6/env/tools/package.sh',
            ],
        },
    }
