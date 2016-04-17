# -*- Makefile -*- 
# __________  _________ _________
# \______   \/   _____//   _____/  | BigSource Script
#  |    |  _/\_____  \ \_____  \   | Project in C/C++ Language
#  |    |   \/        \/        \  |
#  |______  /_______  /_______  /  | @author Luís Ferreira
#         \/        \/        \/   | @license GNU Public License v3
# Copyright (C) 2016 - Luís Ferreira. All right reserved
# 
# This makefile was generated by 'cbp2make' tool rev.147            
# More information in: https://github.com/ljmf00/ (Github Page)

NAME = bss
CC = gcc
CXX = g++
CXX11 = -std=gnu++11
CFLAGS = -Wall -Wextra
RM = rm -rf
MKDIR = mkdir -p

debug: mkdirstep build
all: mkdirstep build cleanobj

mkdirstep:
	$(MKDIR) bin
	$(MKDIR) bin/obj
	$(MKDIR) bin/obj/crypto
	$(MKDIR) bin/obj/convert

build:
	$(CXX) $(CFLAGS) $(CXX11) -c src/core/main.cpp -o bin/obj/main.o

	$(CXX) $(CFLAGS) -c -fpic src/lib/crypto/sha1/sha1.cpp -o bin/obj/crypto/sha1.o
	$(CXX) $(CFLAGS) -c -fpic src/lib/crypto/sha2/sha2.cpp -o bin/obj/crypto/sha2.o
	$(CXX) $(CFLAGS) -c -fpic src/lib/crypto/sha3/sha3.cpp -o bin/obj/crypto/sha3.o
	$(CXX) $(CFLAGS) -c -fpic src/lib/crypto/md5/md5.cpp -o bin/obj/crypto/md5.o
	$(CXX) $(CFLAGS) $(CXX11) -c -fpic src/lib/crypto/aes/aes.cpp -o bin/obj/crypto/aes.o

	$(CXX) $(CFLAGS) -shared -o bin/bslib.so bin/obj/crypto/sha1.o bin/obj/crypto/sha2.o bin/obj/crypto/sha3.o bin/obj/crypto/md5.o bin/obj/crypto/aes.o
	$(CXX) $(CFLAGS) -o bin/bss bin/obj/main.o bin/bslib.so

cleanobj:
	$(RM) bin/obj

clean:
	$(RM) bin