
:'
Color	Foreground Code	Background Code
Black	30	40
Red	    31	41
Green	32	42
Yellow	33	43
Blue	34	44
Magenta	35	45
Cyan	36	46
Light Gray	37	47
Gray	90	100
Light Red	91	101
Light Green	92	102
Light Yellow	93	103
Light Blue	94	104
Light Magenta	95	105
Light Cyan	96	106
White	97	107
To change the color of the text, what we want is the foreground code. There are also a few other non-color special codes that are relevant to us:

Code	Description
0	Reset/Normal
1	Bold text
2	Faint text
3	Italics
4	Underlined text
The echo command prints out text. We need to tell it that we're working with special ANSI codes, not just regular characters. This can be accomplished by adding a \e at the beginning to form an escape sequence. The escape sequence for specifying color codes is \e[COLORm (COLOR represents our color code in this case). By default, echo does not support escape sequences. We need to add the -e option to enable their interpretation.

To print red text, therefore, we could have
echo -e "\e[32mRed text\e[0m"
The \e[0m means we use the special code 0 to reset text color back to normal. Without this, all other text you print out after this would be red.

This works, but it would be more readable if we store the color codes in variables and use those instead.
RED="\e[31m"
ENDCOLOR="\e[0m"

echo -e "${RED}Red text${ENDCOLOR}"
Putting all these together, we could have a script like this
#! /usr/bin/env bash

RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"

echo -e "${RED}This is some red text, ${ENDCOLOR}"
echo -e "${GREEN}And this is some green text${ENDCOLOR}"
GIFDemoing this

We can combine escape codes to get more fancy output.
#! /usr/bin/env bash

RED="31"
GREEN="32"
BOLDGREEN="\e[1;${GREEN}m"
ITALICRED="\e[3;${RED}m"
ENDCOLOR="\e[0m"

echo -e "${BOLDGREEN}Behold! Bold, green text.${ENDCOLOR}"
echo -e "${ITALICRED}Italian italics${ENDCOLOR}"
'