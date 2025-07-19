#include <boost/multiprecision/cpp_int.hpp>

boost::multiprecision::cpp_int foo(boost::multiprecision::cpp_int const &l)
{
    return -1ll * l;
}
