clang_tidy := clang-tidy

tidy:
	${clang_tidy} --version
	${clang_tidy} main.cpp \
		--checks='-*,clang-analyzer-security.ArrayBound' \
		--allow-no-checks \
		-- -isystem third-party/boost-multiprecision/include

.PHONY: tidy
