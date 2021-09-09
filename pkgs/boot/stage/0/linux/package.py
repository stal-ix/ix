def package(mix):
    return {
        'build': {
            'script': mix.files.build_py,
        },
        'runtime': {
            'depends': [
                'env/gcc',
            ],
        },
    }
