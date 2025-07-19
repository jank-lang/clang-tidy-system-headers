# clang-tidy

## How to run
```bash
# Will use clang-tidy on PATH.
make 

# You can override like so.
make clang_tidy=clang-tidy-21
```


## My output
```bash
❯ make
clang-tidy --version
Ubuntu LLVM version 19.1.1
  Optimized build.
clang-tidy main.cpp \
	--checks='-*,clang-analyzer-security.ArrayBound' \
	--allow-no-checks \
	-- -isystem third-party/boost-multiprecision/include
No checks enabled.

❯ make clang_tidy=~/projects/jank/compiler+runtime/build/llvm-install/usr/local/bin/clang-tidy
/home/jeaye/projects/jank/compiler+runtime/build/llvm-install/usr/local/bin/clang-tidy --version
LLVM (http://llvm.org/):
  LLVM version 21.0.0git
  Optimized build.
/home/jeaye/projects/jank/compiler+runtime/build/llvm-install/usr/local/bin/clang-tidy main.cpp \
	--checks='-*,clang-analyzer-security.ArrayBound' \
	--allow-no-checks \
	-- -isystem third-party/boost-multiprecision/include
3 warnings generated.
third-party/boost-multiprecision/include/boost/multiprecision/cpp_int/multiply.hpp:48:46: warning: Out of bound access to memory after the end of the field 'la' [clang-analyzer-security.ArrayBound]
   48 |       carry += static_cast<double_limb_type>(*pa) * static_cast<double_limb_type>(val);
      |                                              ^
/home/jeaye/projects/tmp/clang-tidy-system-headers/main.cpp:5:12: note: Calling constructor for 'number<boost::multiprecision::backends::cpp_int_backend<>, boost::multiprecision::et_on>'
    5 |     return -1ll * l;
      |            ^~~~~~~~
third-party/boost-multiprecision/include/boost/multiprecision/number.hpp:440:7: note: Calling 'number::operator='
  440 |       *this = e;
      |       ^~~~~~~~~
third-party/boost-multiprecision/include/boost/multiprecision/number.hpp:310:27: note: 'value' is true
  310 |       BOOST_IF_CONSTEXPR (std::is_same<self_type, typename detail::expression<tag, Arg1, Arg2, Arg3, Arg4>::result_type>::value)
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
third-party/boost-multiprecision/include/boost/multiprecision/number.hpp:310:7: note: Taking true branch
  310 |       BOOST_IF_CONSTEXPR (std::is_same<self_type, typename detail::expression<tag, Arg1, Arg2, Arg3, Arg4>::result_type>::value)
      |       ^
third-party/boost-multiprecision/include/boost/config/detail/suffix.hpp:1067:30: note: expanded from macro 'BOOST_IF_CONSTEXPR'
 1067 | #  define BOOST_IF_CONSTEXPR if constexpr
      |                              ^
third-party/boost-multiprecision/include/boost/multiprecision/number.hpp:312:10: note: 'value' is false
  312 |          BOOST_MP_CONSTEXPR_IF_VARIABLE_PRECISION(number)
      |          ^
third-party/boost-multiprecision/include/boost/multiprecision/detail/precision.hpp:231:14: note: expanded from macro 'BOOST_MP_CONSTEXPR_IF_VARIABLE_PRECISION'
  231 |    constexpr(boost::multiprecision::detail::is_variable_precision<T>::value)
      |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
third-party/boost-multiprecision/include/boost/multiprecision/number.hpp:312:10: note: Taking false branch
  312 |          BOOST_MP_CONSTEXPR_IF_VARIABLE_PRECISION(number)
      |          ^
third-party/boost-multiprecision/include/boost/multiprecision/detail/precision.hpp:230:4: note: expanded from macro 'BOOST_MP_CONSTEXPR_IF_VARIABLE_PRECISION'
  230 |    if                                               \
      |    ^
third-party/boost-multiprecision/include/boost/multiprecision/number.hpp:319:7: note: Calling 'number::do_assign'
  319 |       do_assign(e, tag_type());
      |       ^~~~~~~~~~~~~~~~~~~~~~~~
third-party/boost-multiprecision/include/boost/multiprecision/number.hpp:1223:7: note: Calling 'number::do_assign'
 1223 |       do_assign(e, tag());
      |       ^~~~~~~~~~~~~~~~~~~
third-party/boost-multiprecision/include/boost/multiprecision/number.hpp:1245:7: note: Calling 'eval_multiply<boost::multiprecision::backends::cpp_int_backend<>, long long, boost::multiprecision::backends::cpp_int_backend<>>'
 1245 |       eval_multiply(m_backend, canonical_value(e.left().value()), canonical_value(e.right().value()));
      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
third-party/boost-multiprecision/include/boost/multiprecision/detail/default_ops.hpp:477:4: note: Calling 'eval_multiply_default<boost::multiprecision::backends::cpp_int_backend<>, long long>'
  477 |    eval_multiply_default(t, u, v);
      |    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
third-party/boost-multiprecision/include/boost/multiprecision/detail/default_ops.hpp:450:4: note: Calling 'eval_multiply<0UL, 0UL, boost::multiprecision::signed_magnitude, boost::multiprecision::unchecked, std::allocator<unsigned long long>, 0UL, 0UL, boost::multiprecision::signed_magnitude, boost::multiprecision::unchecked, std::allocator<unsigned long long>>'
  450 |    eval_multiply(t, v, u);
      |    ^~~~~~~~~~~~~~~~~~~~~~
third-party/boost-multiprecision/include/boost/multiprecision/cpp_int/multiply.hpp:591:8: note: 'val' is <= 0
  591 |    if (val > 0)
      |        ^~~
third-party/boost-multiprecision/include/boost/multiprecision/cpp_int/multiply.hpp:591:4: note: Taking false branch
  591 |    if (val > 0)
      |    ^
third-party/boost-multiprecision/include/boost/multiprecision/cpp_int/multiply.hpp:595:7: note: Calling 'eval_multiply<0UL, 0UL, boost::multiprecision::signed_magnitude, boost::multiprecision::unchecked, std::allocator<unsigned long long>, 0UL, 0UL, boost::multiprecision::signed_magnitude, boost::multiprecision::unchecked, std::allocator<unsigned long long>>'
  595 |       eval_multiply(result, a, static_cast<limb_type>(boost::multiprecision::detail::unsigned_abs(val)));
      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
third-party/boost-multiprecision/include/boost/multiprecision/cpp_int/multiply.hpp:35:9: note: 'val' is not equal to 0
   35 |    if (!val)
      |         ^~~
third-party/boost-multiprecision/include/boost/multiprecision/cpp_int/multiply.hpp:35:4: note: Taking false branch
   35 |    if (!val)
      |    ^
third-party/boost-multiprecision/include/boost/multiprecision/cpp_int/multiply.hpp:40:8: note: Assuming the condition is true
   40 |    if ((void*)&a != (void*)&result)
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
third-party/boost-multiprecision/include/boost/multiprecision/cpp_int/multiply.hpp:40:4: note: Taking true branch
   40 |    if ((void*)&a != (void*)&result)
      |    ^
third-party/boost-multiprecision/include/boost/multiprecision/cpp_int/multiply.hpp:46:11: note: 'p' is not equal to 'pe'
   46 |    while (p != pe)
      |           ^
third-party/boost-multiprecision/include/boost/multiprecision/cpp_int/multiply.hpp:46:4: note: Loop condition is true.  Entering loop body
   46 |    while (p != pe)
      |    ^
third-party/boost-multiprecision/include/boost/multiprecision/cpp_int/multiply.hpp:46:11: note: 'p' is not equal to 'pe'
   46 |    while (p != pe)
      |           ^
third-party/boost-multiprecision/include/boost/multiprecision/cpp_int/multiply.hpp:46:4: note: Loop condition is true.  Entering loop body
   46 |    while (p != pe)
      |    ^
third-party/boost-multiprecision/include/boost/multiprecision/cpp_int/multiply.hpp:46:11: note: 'p' is not equal to 'pe'
   46 |    while (p != pe)
      |           ^
third-party/boost-multiprecision/include/boost/multiprecision/cpp_int/multiply.hpp:46:4: note: Loop condition is true.  Entering loop body
   46 |    while (p != pe)
      |    ^
third-party/boost-multiprecision/include/boost/multiprecision/cpp_int/multiply.hpp:48:46: note: Access of the field 'la' at index 2, while it holds only 2 'unsigned long long' elements
   48 |       carry += static_cast<double_limb_type>(*pa) * static_cast<double_limb_type>(val);
      |                                              ^~~
third-party/boost-multiprecision/include/boost/multiprecision/cpp_int/multiply.hpp:52:7: warning: Out of bound access to memory after the end of the field 'la' [clang-analyzer-security.ArrayBound]
   52 |       *p = static_cast<limb_type>(carry);
      |       ^
/home/jeaye/projects/tmp/clang-tidy-system-headers/main.cpp:5:12: note: Calling constructor for 'number<boost::multiprecision::backends::cpp_int_backend<>, boost::multiprecision::et_on>'
    5 |     return -1ll * l;
      |            ^~~~~~~~
third-party/boost-multiprecision/include/boost/multiprecision/number.hpp:440:7: note: Calling 'number::operator='
  440 |       *this = e;
      |       ^~~~~~~~~
third-party/boost-multiprecision/include/boost/multiprecision/number.hpp:310:27: note: 'value' is true
  310 |       BOOST_IF_CONSTEXPR (std::is_same<self_type, typename detail::expression<tag, Arg1, Arg2, Arg3, Arg4>::result_type>::value)
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
third-party/boost-multiprecision/include/boost/multiprecision/number.hpp:310:7: note: Taking true branch
  310 |       BOOST_IF_CONSTEXPR (std::is_same<self_type, typename detail::expression<tag, Arg1, Arg2, Arg3, Arg4>::result_type>::value)
      |       ^
third-party/boost-multiprecision/include/boost/config/detail/suffix.hpp:1067:30: note: expanded from macro 'BOOST_IF_CONSTEXPR'
 1067 | #  define BOOST_IF_CONSTEXPR if constexpr
      |                              ^
third-party/boost-multiprecision/include/boost/multiprecision/number.hpp:312:10: note: 'value' is false
  312 |          BOOST_MP_CONSTEXPR_IF_VARIABLE_PRECISION(number)
      |          ^
third-party/boost-multiprecision/include/boost/multiprecision/detail/precision.hpp:231:14: note: expanded from macro 'BOOST_MP_CONSTEXPR_IF_VARIABLE_PRECISION'
  231 |    constexpr(boost::multiprecision::detail::is_variable_precision<T>::value)
      |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
third-party/boost-multiprecision/include/boost/multiprecision/number.hpp:312:10: note: Taking false branch
  312 |          BOOST_MP_CONSTEXPR_IF_VARIABLE_PRECISION(number)
      |          ^
third-party/boost-multiprecision/include/boost/multiprecision/detail/precision.hpp:230:4: note: expanded from macro 'BOOST_MP_CONSTEXPR_IF_VARIABLE_PRECISION'
  230 |    if                                               \
      |    ^
third-party/boost-multiprecision/include/boost/multiprecision/number.hpp:319:7: note: Calling 'number::do_assign'
  319 |       do_assign(e, tag_type());
      |       ^~~~~~~~~~~~~~~~~~~~~~~~
third-party/boost-multiprecision/include/boost/multiprecision/number.hpp:1223:7: note: Calling 'number::do_assign'
 1223 |       do_assign(e, tag());
      |       ^~~~~~~~~~~~~~~~~~~
third-party/boost-multiprecision/include/boost/multiprecision/number.hpp:1245:7: note: Calling 'eval_multiply<boost::multiprecision::backends::cpp_int_backend<>, long long, boost::multiprecision::backends::cpp_int_backend<>>'
 1245 |       eval_multiply(m_backend, canonical_value(e.left().value()), canonical_value(e.right().value()));
      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
third-party/boost-multiprecision/include/boost/multiprecision/detail/default_ops.hpp:477:4: note: Calling 'eval_multiply_default<boost::multiprecision::backends::cpp_int_backend<>, long long>'
  477 |    eval_multiply_default(t, u, v);
      |    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
third-party/boost-multiprecision/include/boost/multiprecision/detail/default_ops.hpp:450:4: note: Calling 'eval_multiply<0UL, 0UL, boost::multiprecision::signed_magnitude, boost::multiprecision::unchecked, std::allocator<unsigned long long>, 0UL, 0UL, boost::multiprecision::signed_magnitude, boost::multiprecision::unchecked, std::allocator<unsigned long long>>'
  450 |    eval_multiply(t, v, u);
      |    ^~~~~~~~~~~~~~~~~~~~~~
third-party/boost-multiprecision/include/boost/multiprecision/cpp_int/multiply.hpp:591:8: note: 'val' is <= 0
  591 |    if (val > 0)
      |        ^~~
third-party/boost-multiprecision/include/boost/multiprecision/cpp_int/multiply.hpp:591:4: note: Taking false branch
  591 |    if (val > 0)
      |    ^
third-party/boost-multiprecision/include/boost/multiprecision/cpp_int/multiply.hpp:595:7: note: Calling 'eval_multiply<0UL, 0UL, boost::multiprecision::signed_magnitude, boost::multiprecision::unchecked, std::allocator<unsigned long long>, 0UL, 0UL, boost::multiprecision::signed_magnitude, boost::multiprecision::unchecked, std::allocator<unsigned long long>>'
  595 |       eval_multiply(result, a, static_cast<limb_type>(boost::multiprecision::detail::unsigned_abs(val)));
      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
third-party/boost-multiprecision/include/boost/multiprecision/cpp_int/multiply.hpp:35:9: note: 'val' is not equal to 0
   35 |    if (!val)
      |         ^~~
third-party/boost-multiprecision/include/boost/multiprecision/cpp_int/multiply.hpp:35:4: note: Taking false branch
   35 |    if (!val)
      |    ^
third-party/boost-multiprecision/include/boost/multiprecision/cpp_int/multiply.hpp:40:8: note: Assuming the condition is true
   40 |    if ((void*)&a != (void*)&result)
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
third-party/boost-multiprecision/include/boost/multiprecision/cpp_int/multiply.hpp:40:4: note: Taking true branch
   40 |    if ((void*)&a != (void*)&result)
      |    ^
third-party/boost-multiprecision/include/boost/multiprecision/cpp_int/multiply.hpp:46:11: note: 'p' is not equal to 'pe'
   46 |    while (p != pe)
      |           ^
third-party/boost-multiprecision/include/boost/multiprecision/cpp_int/multiply.hpp:46:4: note: Loop condition is true.  Entering loop body
   46 |    while (p != pe)
      |    ^
third-party/boost-multiprecision/include/boost/multiprecision/cpp_int/multiply.hpp:46:11: note: 'p' is not equal to 'pe'
   46 |    while (p != pe)
      |           ^
third-party/boost-multiprecision/include/boost/multiprecision/cpp_int/multiply.hpp:46:4: note: Loop condition is true.  Entering loop body
   46 |    while (p != pe)
      |    ^
third-party/boost-multiprecision/include/boost/multiprecision/cpp_int/multiply.hpp:46:11: note: 'p' is not equal to 'pe'
   46 |    while (p != pe)
      |           ^
third-party/boost-multiprecision/include/boost/multiprecision/cpp_int/multiply.hpp:46:4: note: Loop condition is true.  Entering loop body
   46 |    while (p != pe)
      |    ^
third-party/boost-multiprecision/include/boost/multiprecision/cpp_int/multiply.hpp:52:7: note: Access of the field 'la' at index 2, while it holds only 2 'unsigned long long' elements
   52 |       *p = static_cast<limb_type>(carry);
      |       ^~
third-party/boost-multiprecision/include/boost/multiprecision/cpp_int/multiply.hpp:62:10: warning: Out of bound access to memory after the end of the field 'la' [clang-analyzer-security.ArrayBound]
   62 |          result.limbs()[i] = static_cast<limb_type>(carry);
      |          ^
/home/jeaye/projects/tmp/clang-tidy-system-headers/main.cpp:5:12: note: Calling constructor for 'number<boost::multiprecision::backends::cpp_int_backend<>, boost::multiprecision::et_on>'
    5 |     return -1ll * l;
      |            ^~~~~~~~
third-party/boost-multiprecision/include/boost/multiprecision/number.hpp:440:7: note: Calling 'number::operator='
  440 |       *this = e;
      |       ^~~~~~~~~
third-party/boost-multiprecision/include/boost/multiprecision/number.hpp:310:27: note: 'value' is true
  310 |       BOOST_IF_CONSTEXPR (std::is_same<self_type, typename detail::expression<tag, Arg1, Arg2, Arg3, Arg4>::result_type>::value)
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
third-party/boost-multiprecision/include/boost/multiprecision/number.hpp:310:7: note: Taking true branch
  310 |       BOOST_IF_CONSTEXPR (std::is_same<self_type, typename detail::expression<tag, Arg1, Arg2, Arg3, Arg4>::result_type>::value)
      |       ^
third-party/boost-multiprecision/include/boost/config/detail/suffix.hpp:1067:30: note: expanded from macro 'BOOST_IF_CONSTEXPR'
 1067 | #  define BOOST_IF_CONSTEXPR if constexpr
      |                              ^
third-party/boost-multiprecision/include/boost/multiprecision/number.hpp:312:10: note: 'value' is false
  312 |          BOOST_MP_CONSTEXPR_IF_VARIABLE_PRECISION(number)
      |          ^
third-party/boost-multiprecision/include/boost/multiprecision/detail/precision.hpp:231:14: note: expanded from macro 'BOOST_MP_CONSTEXPR_IF_VARIABLE_PRECISION'
  231 |    constexpr(boost::multiprecision::detail::is_variable_precision<T>::value)
      |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
third-party/boost-multiprecision/include/boost/multiprecision/number.hpp:312:10: note: Taking false branch
  312 |          BOOST_MP_CONSTEXPR_IF_VARIABLE_PRECISION(number)
      |          ^
third-party/boost-multiprecision/include/boost/multiprecision/detail/precision.hpp:230:4: note: expanded from macro 'BOOST_MP_CONSTEXPR_IF_VARIABLE_PRECISION'
  230 |    if                                               \
      |    ^
third-party/boost-multiprecision/include/boost/multiprecision/number.hpp:319:7: note: Calling 'number::do_assign'
  319 |       do_assign(e, tag_type());
      |       ^~~~~~~~~~~~~~~~~~~~~~~~
third-party/boost-multiprecision/include/boost/multiprecision/number.hpp:1223:7: note: Calling 'number::do_assign'
 1223 |       do_assign(e, tag());
      |       ^~~~~~~~~~~~~~~~~~~
third-party/boost-multiprecision/include/boost/multiprecision/number.hpp:1245:7: note: Calling 'eval_multiply<boost::multiprecision::backends::cpp_int_backend<>, long long, boost::multiprecision::backends::cpp_int_backend<>>'
 1245 |       eval_multiply(m_backend, canonical_value(e.left().value()), canonical_value(e.right().value()));
      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
third-party/boost-multiprecision/include/boost/multiprecision/detail/default_ops.hpp:477:4: note: Calling 'eval_multiply_default<boost::multiprecision::backends::cpp_int_backend<>, long long>'
  477 |    eval_multiply_default(t, u, v);
      |    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
third-party/boost-multiprecision/include/boost/multiprecision/detail/default_ops.hpp:450:4: note: Calling 'eval_multiply<0UL, 0UL, boost::multiprecision::signed_magnitude, boost::multiprecision::unchecked, std::allocator<unsigned long long>, 0UL, 0UL, boost::multiprecision::signed_magnitude, boost::multiprecision::unchecked, std::allocator<unsigned long long>>'
  450 |    eval_multiply(t, v, u);
      |    ^~~~~~~~~~~~~~~~~~~~~~
third-party/boost-multiprecision/include/boost/multiprecision/cpp_int/multiply.hpp:591:8: note: 'val' is <= 0
  591 |    if (val > 0)
      |        ^~~
third-party/boost-multiprecision/include/boost/multiprecision/cpp_int/multiply.hpp:591:4: note: Taking false branch
  591 |    if (val > 0)
      |    ^
third-party/boost-multiprecision/include/boost/multiprecision/cpp_int/multiply.hpp:595:7: note: Calling 'eval_multiply<0UL, 0UL, boost::multiprecision::signed_magnitude, boost::multiprecision::unchecked, std::allocator<unsigned long long>, 0UL, 0UL, boost::multiprecision::signed_magnitude, boost::multiprecision::unchecked, std::allocator<unsigned long long>>'
  595 |       eval_multiply(result, a, static_cast<limb_type>(boost::multiprecision::detail::unsigned_abs(val)));
      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
third-party/boost-multiprecision/include/boost/multiprecision/cpp_int/multiply.hpp:35:9: note: 'val' is not equal to 0
   35 |    if (!val)
      |         ^~~
third-party/boost-multiprecision/include/boost/multiprecision/cpp_int/multiply.hpp:35:4: note: Taking false branch
   35 |    if (!val)
      |    ^
third-party/boost-multiprecision/include/boost/multiprecision/cpp_int/multiply.hpp:40:8: note: Assuming the condition is true
   40 |    if ((void*)&a != (void*)&result)
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
third-party/boost-multiprecision/include/boost/multiprecision/cpp_int/multiply.hpp:40:4: note: Taking true branch
   40 |    if ((void*)&a != (void*)&result)
      |    ^
third-party/boost-multiprecision/include/boost/multiprecision/cpp_int/multiply.hpp:46:11: note: Assuming 'p' is not equal to 'pe'
   46 |    while (p != pe)
      |           ^~~~~~~
third-party/boost-multiprecision/include/boost/multiprecision/cpp_int/multiply.hpp:46:4: note: Loop condition is true.  Entering loop body
   46 |    while (p != pe)
      |    ^
third-party/boost-multiprecision/include/boost/multiprecision/cpp_int/multiply.hpp:46:11: note: Assuming 'p' is not equal to 'pe'
   46 |    while (p != pe)
      |           ^~~~~~~
third-party/boost-multiprecision/include/boost/multiprecision/cpp_int/multiply.hpp:46:4: note: Loop condition is true.  Entering loop body
   46 |    while (p != pe)
      |    ^
third-party/boost-multiprecision/include/boost/multiprecision/cpp_int/multiply.hpp:46:4: note: Loop condition is false. Execution continues on line 57
third-party/boost-multiprecision/include/boost/multiprecision/cpp_int/multiply.hpp:57:8: note: Assuming 'carry' is not equal to 0
   57 |    if (carry)
      |        ^~~~~
third-party/boost-multiprecision/include/boost/multiprecision/cpp_int/multiply.hpp:57:4: note: Taking true branch
   57 |    if (carry)
      |    ^
third-party/boost-multiprecision/include/boost/multiprecision/cpp_int/multiply.hpp:61:7: note: Taking true branch
   61 |       if (result.size() > i)
      |       ^
third-party/boost-multiprecision/include/boost/multiprecision/cpp_int/multiply.hpp:62:10: note: Access of the field 'la' at index 2, while it holds only 2 'unsigned long long' elements
   62 |          result.limbs()[i] = static_cast<limb_type>(carry);
      |          ^~~~~~~~~~~~~~~~~
```
