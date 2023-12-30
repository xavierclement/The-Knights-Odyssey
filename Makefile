# Copyright (c) 2023 XAVIER Clément Antoine
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>.

NAME = The-Knights-Odyssey

SRC_DIR = ./src
OBJ_DIR = ./obj
INCLUDE_DIR = ./
BIN_DIR = ./bin

SRC = $(wildcard $(SRC_DIR)/*.cpp)
OBJ = $(SRC:$(SRC_DIR)/%.cpp=$(OBJ_DIR)/%.o)
BIN = $(BIN_DIR)/$(NAME).app

CXX = g++
CXXFLAGS = -W -Wall -Wextra -Werror -std=gnu++20 -I$(INCLUDE_DIR)
LDFLAGS = -lsfml-audio -lsfml-graphics -lsfml-network -lsfml-system -lsfml-window

all: $(BIN)

$(BIN): $(OBJ)
	$(CXX) -o $@ $^ $(LDFLAGS)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CXX) -o $@ -c $< $(CXXFLAGS)

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(BIN)

re: fclean all

.PHONY: all clean fclean re
