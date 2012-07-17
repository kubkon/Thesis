#!/usr/bin/env python3
import os
import sys

# Params
filename = "thesis"
rm_list = ["aux", "bbl", "blg", "log", "lof", "lol", "lot", "nlo", "out", "toc", "mtc*", "maf"]

# LaTeX compilation & cleaning
os.system("xelatex {0}.tex".format(filename))
os.system("bibtex -terse MyPublications")
os.system("bibtex -terse {0}".format(filename))
for i in range(2):
  os.system("xelatex {0}.tex".format(filename))
rm_string = ' '.join(["*.{}".format(el) for el in rm_list])
os.system("rm {}".format(rm_string))
dirs = [l for l in os.listdir(".") if os.path.isdir(l) and l != ".git"]
for d in dirs:
	os.system("rm {}/{}".format(d, rm_string))
os.system("open -a Preview {0}.pdf".format(filename))
