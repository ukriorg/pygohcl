# pygohcl
Python wrapper for [hashicorp/hcl](https://github.com/hashicorp/hcl) (v2).

## Requirements
The following versions are supported - 3.6, 3.7, 3.8.

## Setup
```sh
pip install pygohcl
```

## Usage
```py
>>> import pygohcl
>>> pygohcl.loads("""variable "docker_ports" {
...   type = list(object({
...     internal = number
...     external = number
...     protocol = string
...   }))
...   default = [
...     {
...       internal = 8300
...       external = 8300
...       protocol = "tcp"
...     }
...   ]
... }""")
{'variable': {'docker_ports': {'default': [{'external': 8300, 'internal': 8300, 'protocol': 'tcp'}], 'type': 'list(object({internal=numberexternal=numberprotocol=string}))'}}}
```

## Building locally

Clone the repo:

```sh
git clone https://github.com/ukriorg/pygohcl $HOME/pygohcl
```

You can use the following commands to build a wheel for your platform:
```sh
pip install wheel
python3 -m venv venv
. venv/bin/activate
cd $HOME/pygohcl
run ./build-wheel.sh
pip3 install pygohcl --no-index -f "./dist/"
```


The wheel will be available in `./dist/`.
