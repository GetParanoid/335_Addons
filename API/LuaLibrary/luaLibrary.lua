--==============================
-- Lua library functions
--==============================

--- Returns the absolute value of a number. Alias for the standard library function math.abs .
---@param x number A number
---@return number absoluteValue Absolute value of x
function abs(x) end

--- Causes a Lua error if a condition is failed
---@param condition any Any value (commonly the result of an expression)
---@param message string Error message to be produced if condition is false or nil
---@return any value The condition value provided, if not false or nil
function assert(condition, message) end

--- Returns the smallest integer larger than or equal to a number. Alias for the standard library function math.ceil .
---@param x number A number
---@return number ceiling Smallest integer larger than or equal to x
function ceil(x) end

--- Interface to the Lua garbage collector
---@param option any One of the following options collect - Performs a full garbage collection cycle count - Returns the total Lua memory usage (in kilobytes) restart - Restarts the garbage collector setpause - Sets the garbage collector's pause percentage to arg ; e.g., if 200, the collector waits for memory usage to double before starting a new cycle setstepmul - Sets the garbage collector's speed (as a percentage relative to memory allocation) to arg ; e.g., if 200, the collector runs twice as fast as memory is allocated step - Performs a garbage collection step, with size arg stop - Stops the garbage collector
---@param arg any Argument applicable to some options
function collectgarbage(option, arg) end

--- Returns a formatted date/time string for a date (or the current date). Alias to the standard library function os.date .
---@param format string A string describing the formatting of time values (as in the ANSI C strftime() function), or *t to return the time as a table; optionally preceded by ! for Coordinated Universal Time instead of the local time zone; omitted for a date printed in the default format
---@param time number Time value to be formatted (see time() for description); if omitted, uses the current time
---@return string dateValue A formatted date/time string,
function date(format, time) end

--- Converts an angle measurement in radians to degrees. Alias for the standard library function math.deg .
---@param radians number An angle specified in radians
---@return number degrees The angle specified in degrees
function deg(radians) end

--- Returns the number of seconds between two time values. Alias for the standard library function os.difftime .
---@param time2 number A time value (see time() for description)
---@param time1 number A time value (see time() for description)
---@return number seconds Number of seconds between time2 and time1 ; equivalent to time2 - time1 on all current WoW clients
function difftime(time2, time1) end

--- Causes a Lua error message
---@param message string An error message to be displayed
---@param level number Level in the function stack at which the error message begins providing function information; e.g. 1 (the default, if omitted) to start at the position where error() was called, 2 to start at the function which called error() , 3 to start at the function which called that function, etc.
function error(message, level) end

--- Returns the value of the exponential function for a number. Alias for the standard library function math.exp .
---@param x number A number
---@return number exp Value of the mathematical constant e (Euler's number) raised to the x th power
function exp(x) end

--- Returns the largest integer smaller than or equal to a number. Alias for the standard library function math.floor .
---@param x number A number
---@return number floor Largest integer smaller than or equal to x
function floor(x) end

--- . Alias for the standard library function table.foreach . Deprecated in Lua 5.1; use a for loop and the pairs function instead (see example).
--- Flags: deprecated
function foreach() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: deprecated
function foreachi() end

--- Returns a formatted string containing specified values. Alias for the standard library function string.format .  This version, however, includes the positional argument specifiers from Lua 4.0.
---@param formatString string A string containing format specifiers as per the ANSI C printf function
---@return number formatted The formatted string
function format(formatString) end

--- Returns the normalized fraction and base-2 exponent for a number. Alias for the standard library function math.frexp .
---@param x number A number
---@return number m A number whose absolute value is in the range [0.5, 1), or 0 if x is 0
---@return number e An integer, such that x = m * 2 ^ e
function frexp(x) end

--- Returns the total Lua memory usage. Deprecated in Lua 5.1; use collectgarbage("count") instead.
--- Flags: deprecated
---@return number count Total Lua memory usage (in kilobytes)
function gcinfo() end

--- Returns the environment for a function (or the global environment). If the environment has a __environment metatable, that value is returned instead.
---@param f function A function
---@param stackLevel number Level of a function in the calling stack
---@return table env Table containing all variables in the function's environment, or the global environment if f or stackLevel is omitted
function getfenv(f, stackLevel) end

--- Returns an object's metatable
---@param object any Any table or userdata object
---@return any metatable Contents of the object's __metatable field, or nil if the object has no metatable
function getmetatable(object) end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: deprecated
function getn() end

--- Returns an iterator function for finding pattern matches in a string. Alias for the standard library function string.gmatch .
---@param s string A string
---@param pattern string A regular expression pattern
---@return function iterator A function which, each time it is called, returns the next capture of pattern in the string s ; always returns the whole string if pattern specifies no captures
function gmatch(s, pattern) end

--- Returns a string in which occurrences of a pattern are replaced. Alias for the standard library function string.gsub .
---@param s string A string
---@param pattern string A regular expression pattern
---@param rep string String with which to replace occurrences of pattern ; may contain specifiers for numbered captures in the pattern
---@param repTable table Table containing replacement strings; replacements are looked up using captured substrings as keys, or the entire match if pattern specifies no captures
---@param repFunc function Function to supply replacement strings; called with captured substrings (or the entire match if pattern specifies no captures) as arguments
---@param maxReplaced number Maximum number of replacements to be made
---@return string newString A copy of s in which occurrences of the pattern have been replaced as specified
---@return number numMatched Number of matches found
function gsub(s, pattern, rep, repTable, repFunc, maxReplaced) end

--- Returns an iterator function for integer keys in a table. Return values are such that the construction
---@param t table A table
---@return function iterator An iterator
---@return table t The table provided
---@return number index Always 0; used internally
function ipairs(t) end

--- Returns the number generated by a normalized fraction and base-2 exponent. Alias for the standard library function math.ldexp .
---@param m number A number
---@param e number A number
---@return number x The value of m * 2 ^ e
function ldexp(m, e) end

--- Loads and compiles Lua source code
---@param s string A string containing Lua code
---@param chunkname string Name for the loaded chunk; used in error messages and debug information
---@return function chunk A function which can be run to execute the provided code, or nil if the code could not be compiled
---@return string error Error message, if the code could not be compiled
function loadstring(s, chunkname) end

--- Returns the natural logarithm of a number. Alias for the standard library function math.log .
---@param x number A number
---@return number naturalLog The natural logarithm of x
function log(x) end

--- Returns the base-10 logarithm of a number. Alias for the standard library function math.log10 .
---@param x number A number
---@return number base10log The base-10 logarithm of x
function log10(x) end

--- Returns the greatest of a list of numbers. Alias for the standard library function math.max .
---@return number maximum The highest number among all arguments
function max() end

--- Returns the least of a list of numbers. Alias for the standard library function math.min .
---@return number maximum The lowest number among all arguments
function min() end

--- Returns the remainder from division of two numbers. Alias for the standard library function math.fmod .
---@param x number A number
---@param y number A number
---@return number remainder Remainder of the division of x by y that rounds the quotient towards zero
function mod(x, y) end

--- Returns the next key/value pair in a table
---@param t table A table
---@param key any A key in the table
---@return any nextKey The next key in the table t
---@return any nextValue Value associated with the next key in the table t
function next(t, key) end

--- Returns an iterator function for a table. Return values are such that the construction
---@param t table A table
---@return function iterator The next() function
---@return table t The table provided
---@return number index Always nil; used internally
function pairs(t) end

--- Executes a function in protected mode. When running a function in protected mode, any errors do not propagate beyond the function (i.e. they do not stop all execution and call the default error handler).
---@param f function A function
---@return boolean status True if the function succeeded without errors; false otherwise
function pcall(f) end

--- Converts an angle specified in degrees to radians. Alias for the standard library function math.rad .
---@param degrees number An angle specified in degrees
---@return number radians The angle specified in radians
function rad(degrees) end

--- Generates a pseudo-random number. Alias for the standard library function math.random .
---@param m number First limit for randomly generated numbers
---@param n number Second limit for randomly generated numbers
---@return number randomNum If called without arguments, a uniform pseudo-random real number in the range [0,1); if m is specified, a uniform pseudo-random integer in the range [1,m]; if both m and n are specified, a uniform pseudo-random integet in the range [m,n]
function random(m, n) end

--- Returns whether two values are equal without invoking any metamethods
---@param v1 any Any value
---@param v2 function Any value
---@return boolean isEqual True if the values are equal; false otherwise
function rawequal(v1, v2) end

--- Returns the real value associated with a key in a table without invoking any metamethods
---@param t table A table
---@param key any A key in the table
---@return any value Value of t[key]
function rawget(t, key) end

--- Sets the value associated with a key in a table without invoking any metamethods
---@param t table A table
---@param key any A key in the table (cannot be nil )
---@param value any New value to set for the key
function rawset(t, key, value) end

--- Returns one or more values from a list ( ... ), or the number of values in a list
---@param index number Index of a value in the list
function select(index) end

--- Sets the environment to be used by a function. If the environment has a __environment metatable, this function will error.
---@param f function A function
---@param stackLevel number Level of a function in the calling stack, or 0 to set the global environment
---@param t table A table
---@return function f The input function f
function setfenv(f, stackLevel, t) end

--- Sets the metatable for a table
---@param t table A table
---@param metatable table A metatable for the table t , or nil to remove an existing metatable
---@return table t The input table t
function setmetatable(t, metatable) end

--- Sorts a table. Alias for the standard library function table.sort .
---@param table number A table
---@param comparator function A function to compare table elements during the sort; takes two arguments and returns true if the first argument should be ordered before the second in the sorted table; equivalent to function(a,b) return a < b end if omitted
function sort(table, comparator) end

--- Returns the square root of a number. Alias for the standard library function math.sqrt .
---@param x number A number
---@return number root The square root of x
function sqrt(x) end

--- Returns the numeric code for one or more characters in a string. Alias for the standard library function string.byte .
---@param s string A string
---@param firstChar number Position of a character in the string (can be negative to count backwards from the end of the string); defaults to 1 if omitted
---@param lastChar number Position of a later character in the string (can be negative to count backwards from the end of the string); defaults to firstChar if omitted
---@return number value Numeric code for the character at position firstChar in the string
function strbyte(s, firstChar, lastChar) end

--- Returns the character(s) for one or more numeric codes. Alias for the standard library function string.char .
---@param n number An integer
---@return number s A string containing the character(s) for the given numeric code(s)
function strchar(n) end

--- Returns information about matches for a pattern in a string. Alias for the standard library function string.find .
---@param s string A string
---@param pattern string A regular expression pattern
---@param init number Initial position in the string s at which to begin the search; defaults to 1 if omitted
---@param plain boolean True to perform a simple substring search (i.e. considering pattern only as a literal string, not a regular expression); false or omitted otherwise
---@return number start Character position in s at which the first match begins
---@return number end Character position in s at which the first match ends
function strfind(s, pattern, init, plain) end

--- Returns the number of characters in a string. Alias for the standard library function string.len .
---@param s string A string
---@return number length Number of characters in the string
function strlen(s) end

--- Returns a copy of a string with all uppercase letters converted to lowercase. Alias for the standard library function string.lower
---@param s string A string
---@return string lowerCase A copy of the string s with all uppercase letters converted to lowercase
function strlower(s) end

--- Returns the matches for a for a pattern in a string. Alias for the standard library function string.match .
---@param s string A string
---@param pattern string A regular expression pattern
---@return string match First substring of s matching pattern , or the first capture if pattern specifies captures; nil if no match is found
function strmatch(s, pattern) end

--- Returns a string produced by a number of repetitions of another string. Alias for the standard library function string.rep .
---@param s string A string
---@param n number A number
---@return string repeated The concatenation of n copies of the string s
function strrep(s, n) end

--- Returns the reverse of a string. Alias for the standard library function string.reverse .
---@param s string A string
---@return string s A string containing the characters of string s in reverse order
function strrev(s) end

--- Returns a substring of a string. Alias for the standard library function string.sub .
---@param s string A string
---@param firstChar number Position of a character in the string (can be negative to count backwards from the end of the string)
---@param lastChar number Position of a later character in the string (can be negative to count backwards from the end of the string); defaults to -1 if omitted
---@return string s The substring of s starting at the character firstChar and ending with the character lastChar
function strsub(s, firstChar, lastChar) end

--- Returns a copy of a string with all lowercase letters converted to uppercase. Alias for the standard library function string.upper .
---@param str string A string
---@return string lowerCase A copy of the string s with all lowercase letters converted to uppercase
function strupper(str) end

--- Returns the numeric time value for a described date/time (or the current time). Alias for the standard library function os.time .
---@param timeDesc table Table describing a date and time, as returned by date("*t") ; if omitted, uses the current time
---@return number t Number of seconds elapsed since midnight, January 1, 1970 UTC
function time(timeDesc) end

--- Inserts a value into a table. Alias for the standard library function table.insert .
---@param table table A table
---@param position number Index in the table at which to insert the new value; if omitted, defaults to #table + 1
---@param value any Any value
function tinsert(table, position, value) end

--- Returns the numeric value of a string
---@param x any A string or number
---@param base number Base in which to interpret the numeral (integer between 2 and 36); letters 'A-Z' can be used to denote place values 10 or above in bases greater than 10; defaults to 10 if omitted
---@return number numValue Numeric value of x in the given base, or nil if the value cannot be converted to a number
function tonumber(x, base) end

--- Returns a string representation of a value
---@param value any Any value
---@return string stringValue String representation of the given value (if value is an object with a __tostring metamethod, that method is used to produce the string representation)
function tostring(value) end

--- Removes an element from a table. Alias for the standard library function table.remove .
---@param table table A table
---@param position number Index in the table from which to remove the value; if omitted, defaults to #table
function tremove(table, position) end

--- Returns a string describing the data type of a value
---@param v any Any value
---@return any typeString A string describing the type of value v ( string ) boolean - A boolean value ( true or false ) function - A function nil - The special value nil number - A numeric value string - A string table - A table thread - A coroutine thread userdata - Data external to the Lua environment
function type(v) end

--- Returns the list of elements in a table. Equivalent to
---@param t table A table
---@param i number A numeric index to the table; defaults to 1 if omitted
---@param j number A numeric index to the table; defaults to #t if omitted
function unpack(t, i, j) end

--- Executes a function in protected mode with a custom error handler
---@param f function A function
---@param err function Error handler function to be used should f cause an error
---@return boolean status True if the function succeeded without errors; false otherwise
function xpcall(f, err) end
