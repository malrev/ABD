# Advanced Binary Deobfuscation

This repository contains the course materials of Advanced Binary Deobfuscation at the [Global Cybersecurity Camp (GCC) Tokyo](https://www.security-camp.or.jp/event/gcc_tokyo_program.html) and the [Security Camp National Workshop](https://www.security-camp.or.jp/camp/index.html) in 2020.

## Course Abstract

Reverse engineering is not easy, especially if a binary code is obfuscated. Once obfuscation performed, the binary would not be analyzed accurately with naive techniques alone. In this course, you will learn obfuscation principles (especially used by malware), theory and practice of obfuscated code analysis, and how to write your own tool for deobfuscation. In particular, we delve into data-flow analysis and SAT/SMT-based binary analysis (e.g., symbolic execution) to render obfuscation ineffective.

## Outline

This course is about binary deobfuscation, meant for security analysts and researchers (in embryo) looking to add a skill set on writing your own tool to their arsenal. At the end of this class, attendees will be able to:
- Have an in-depth understanding of theory, practice, and behind insights of obfuscation
- Build a custom obfuscated payload with state-of-the-art packers
- Apply compiler optimization techniques to binary analysis tasks
- Design and implement automated binary analysis tools top on a symbolic execution engine
- Even analyze obfuscated malware used in the APT campaign

Towards this end, the course was held in the form of a combination of classroom learning and hands-on training at GCC.

## Prerequisite Knowledge

Attendees should have:
- Robust skill set in x86/x64 architecture
- Basic experience with C/C++ and Python
- Basic understanding of low-level CS (e.g., OSs, Compilers, interpreters, linkers, and loaders)

The following links are useful to bridge the gap.
- [Reverse Engineering 101](https://malwareunicorn.org/workshops/re101.html)
- [Modern Binary Exploitation by RPISEC](https://github.com/RPISEC/MBE)

## Quick Start

We assume Ubuntu 18.04 with Miasm, Z3, and Jupyter Notebook.

1. Install [VirtualBox](https://www.virtualbox.org/wiki/Linux_Downloads)
2. Download [Ubuntu 18.04.3 Image](https://sourceforge.net/projects/osboxes/files/v/vb/55-U-u/18.04/18.04.3/18.04.3VB-64bit.7z/download) and install it in VirtualBox
3. Clone this repository
4. Execute `./setup.sh ./`
5. Install [IDA Freeware](https://www.hex-rays.com/products/ida/support/download_freeware.shtml)
6. Read `Advanced-Binary-Deobfuscation.pdf` and enjoy!

