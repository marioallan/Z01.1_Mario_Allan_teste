# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this file,
# You can obtain one at http://mozilla.org/MPL/2.0/.
#
# Copyright (c) 2014-2020, Lars Asplund lars.anders.asplund@gmail.com

"""
VHDL UART
---------
A more realistic test bench of an UART to show VUnit VHDL usage on a
typical module.
"""

from pathlib import Path
from vunit import VUnit

import shutil

VU = VUnit.from_argv()
VU.add_osvvm()
VU.add_verification_components()

SRC_PATH = Path(__file__).parent 

  
# Source path 
#source = "/home/mario/virtualenv/Z01.1_Mario_Allan_teste/VHDL/neander/mif/programa_que_compara_tres_valores_e_informa_o_maior.mif"
source = SRC_PATH / "mif" / "programa_que_compara_tres_valores_e_informa_o_maior.mif"
  
# Destination path 
#destination = "/home/mario/virtualenv/Z01.1_Mario_Allan_teste/vunit_out/modelsim"
destination = SRC_PATH / ".." / ".." / "vunit_out" / "modelsim"

VU.add_library("neander_lib").add_source_files(SRC_PATH / "src" / "*.vhd")
VU.add_library("tb_neander_lib").add_source_files(SRC_PATH / "test" / "*.vhd")

shutil.copy(source, destination)

VU.main()
