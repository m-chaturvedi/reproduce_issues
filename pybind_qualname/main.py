#!/usr/bin/python3
# Tested with python 3.7

import python_module
import pybind_module
from pprint import pprint

if __name__ == "__main__":
    assert python_module.Pet.get_data.__qualname__ == "Pet.get_data"
    assert python_module.Pet.__init__.__qualname__ == "Pet.__init__"

    assert pybind_module.Pet.get_data.__qualname__ == "PyCapsule.get_data"
    assert pybind_module.Pet.__init__.__qualname__ == "PyCapsule.__init__"
