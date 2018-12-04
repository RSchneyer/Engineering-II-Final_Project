% MATLAB doesn't let you directly use ints/doubles in disp() statements if there are also strings in there
% This function lets you display a string followed by an number (potentially followed by another string)
% This is done by displaying an array, which contains the string1 arg, followed by the number converted to a string
function dispNumAndString(string1, num, string2="", string3="")
    disp([string1, num2str(num), string2, string3]);
endfunction