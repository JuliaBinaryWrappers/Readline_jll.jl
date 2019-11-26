# Autogenerated wrapper script for Readline_jll for powerpc64le-linux-gnu
export libreadline, libhistory

using Ncurses_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `libreadline`
const libreadline_splitpath = ["lib", "libreadline.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libreadline_path = ""

# libreadline-specific global declaration
# This will be filled out by __init__()
libreadline_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libreadline = "libreadline.so.8"


# Relative path to `libhistory`
const libhistory_splitpath = ["lib", "libhistory.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libhistory_path = ""

# libhistory-specific global declaration
# This will be filled out by __init__()
libhistory_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libhistory = "libhistory.so.8"


"""
Open all libraries
"""
function __init__()
    global prefix = abspath(joinpath(@__DIR__, ".."))

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    append!.(Ref(PATH_list), (Ncurses_jll.PATH_list,))
    append!.(Ref(LIBPATH_list), (Ncurses_jll.LIBPATH_list,))

    global libreadline_path = abspath(joinpath(artifact"Readline", libreadline_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libreadline_handle = dlopen(libreadline_path)
    push!(LIBPATH_list, dirname(libreadline_path))

    global libhistory_path = abspath(joinpath(artifact"Readline", libhistory_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libhistory_handle = dlopen(libhistory_path)
    push!(LIBPATH_list, dirname(libhistory_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

