clang_tidy := clang-tidy

tidy:
	${clang_tidy} main.cpp \
		--checks='-*,clang-analyzer-security.ArrayBound' \
		-- -isystem third-party/boost-multiprecision/include

.PHONY: tidy
