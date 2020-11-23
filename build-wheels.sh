#!/bin/bash -x
build_dir=${PWD}
export HOME=/tmp
# Build source tar
python setup.py sdist
# Wheels will be written to /tmp before being auditwheel-repaired
cd /tmp
pip install -r "${build_dir}/dev-requirements.txt"
pip wheel --no-deps --wheel-dir /tmp "${build_dir}"/dist/*.tar.gz
ls ./*.whl | xargs -n1 --verbose auditwheel repair --wheel-dir "${build_dir}/dist"
# Install packages and test
pip install pygohcl --no-index -f "${build_dir}/dist"
# Auditwheel-repaired wheels
ls -al "${build_dir}/dist"
