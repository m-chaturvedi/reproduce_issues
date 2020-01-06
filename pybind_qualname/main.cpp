#include <pybind11/pybind11.h>
#include <iostream>
namespace py = pybind11;

class Pet {
 public:
        Pet() {
            c = 10;
        }
        ~Pet() {}
        int get_data() {
            return c;
        }

 private:
        int c;
};


PYBIND11_MODULE(pybind_module, m) {
    using rvp = pybind11::return_value_policy;
    py::class_<Pet>(m, "Pet")
        .def(py::init<>())
        .def("get_data", &Pet::get_data);
}
